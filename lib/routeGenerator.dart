// ignore: file_names
import 'package:clientapp/scenes/home/index.dart';
import 'package:clientapp/scenes/login/index.dart';
import 'package:clientapp/scenes/register/index.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const GlyphGatewayHomePage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/takeimage':
        //
        return MaterialPageRoute(builder: (_) => const Login());
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
