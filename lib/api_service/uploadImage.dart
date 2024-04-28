// ignore: file_names
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadImage(File imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://10.0.2.2:8000/glyphServer/upload_image/'),
  );
  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ),
  );

  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully!');
    } else {
      print('Failed to upload image: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}
