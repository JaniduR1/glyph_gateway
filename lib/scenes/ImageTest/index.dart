import 'dart:io';

import 'package:clientapp/Image_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 64,
                    foregroundImage: _image != null ? FileImage(_image!) : null,
                    child: Text(
                      widget.initals,
                      style: const TextStyle(fontSize: 48),
                    )))),
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
                  });
                }
              }
            },
            child: const Text('Capture Image'))
      ],
    );
  }
}
