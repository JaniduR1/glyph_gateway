import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> uploadImage(BuildContext context, File imageFile) async {
  var uri = Uri.parse('http://10.0.2.2:5001/api/predict/');
  // var uri = Uri.parse('http://<Use your own IP (the one with the server running)>:5001/api/predict/');
  var request = http.MultipartRequest('POST', uri);
  var multipartFile =
      await http.MultipartFile.fromPath('image', imageFile.path);
  request.files.add(multipartFile);

  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var parsedResponse = jsonDecode(responseBody);
      print('Predicted class index  ss: ${parsedResponse}');

      if (parsedResponse is Map && parsedResponse.containsKey("message")) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Prediction Result'),
              content:
                  Text('Predicted class index  : ${parsedResponse["message"]}'),
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
      } else {
        print('Invalid result after uploading image.');
      }
    } else {
      print('Failed to upload image: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image : $e');
  }
}
