import 'package:clientapp/routeGenerator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GlyphGateway",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      //routes: {'/register': (_) => const Register()},
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
