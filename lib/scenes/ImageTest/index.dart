import 'dart:io';

import 'package:clientapp/Image_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;

final imageHelper = ImageHelper();

class ImagePickerCropper extends StatelessWidget {
  const ImagePickerCropper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Manipulator'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        children: const [ProfileImage(initals: 'AB')],
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
    required this.initals,
  });
  final String initals;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ProfileImageState();
}

// ignore: unused_element
class _ProfileImageState extends State<ProfileImage> {
  File? _image;
  String? _responseBody;
  bool _loading = false; // Add a loading indicator variable

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: _image != null
                  ? Image.file(
                      height: screenHeight * 0.5,
                      _image!,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
            onPressed: () async {
              final files = await imageHelper.pickImage();
              if (files.isNotEmpty) {
                final croppedFile = await imageHelper.crop(
                  file: files.first,
                  cropStyle: CropStyle.rectangle,
                );
                if (croppedFile != null) {
                  setState(() {
                    _image = File(croppedFile.path);
                    _loading =
                        true; // Set loading to true when processing starts
                  });
                  //################################
                  var uri = Uri.parse('http://10.0.2.2:5001/api/predict/');
                  var request = http.MultipartRequest('POST', uri);
                  var multipartFile = await http.MultipartFile.fromPath(
                      'image', croppedFile.path);
                  request.files.add(multipartFile);

                  try {
                    var response = await request.send();
                    if (response.statusCode == 200) {
                      var responseBody = await response.stream.bytesToString();
                      print(
                          'Predicted class index: ${responseBody} ${response.statusCode}');
                      setState(() {
                        _responseBody = responseBody;
                        _loading =
                            false; // Set loading to false when result is received
                      });
                      _showAlertDialog(
                          context, 'Identified Symbol : ${responseBody}');
                    } else {
                      print('Failed to upload image');
                    }
                  } catch (e) {
                    print('Error uploading image 01: $e');
                  }

                  //#################################################
                }
              }
            },
            child: _loading // Display different text based on loading state
                ? CircularProgressIndicator() // Loading indicator
                : const Text('Capture Image')),
        if (_responseBody != null) Text(_responseBody!),
      ],
    );
  }
}

void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('GlyphGateway'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
