// ignore: file_names
import 'package:camera/camera.dart';
import 'package:clientapp/scenes/ImageTest/index.dart';
import 'package:clientapp/scenes/camera/index.dart';
import 'package:clientapp/scenes/home/index.dart';
import 'package:clientapp/scenes/login/index.dart';
import 'package:clientapp/scenes/register/index.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const GlyphGatewayHomePage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/login2':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/login':
        return MaterialPageRoute(builder: (_) => const ImagePickerCropper());
      case '/takeimage':
        if (args is CameraDescription) {
          return MaterialPageRoute(
              builder: (_) => TakePictureScreen(
                    camera: args,
                  ));
        } else {
          return unknownRoute();
        }

      default:
        return unknownRoute();
    }
  }

  static Route<dynamic> unknownRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(child: Text("Unknown route")),
      );
    });
  }
}
