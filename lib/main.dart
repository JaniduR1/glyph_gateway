import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const GlyphGatewayHomePage(), //class
      //home: const Login(), //Render-class
      home: const Register(), //Render-class
    );
  }
}

class GlyphGatewayHomePage extends StatelessWidget {
  const GlyphGatewayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        toolbarHeight: 20,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('lib/assests/homebg.png'),
                alignment: Alignment.center,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            // child: const Center(
            //   child: Text(
            //     "This is the Glyph Gateway Home Page.",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 24.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ),
          Positioned(
            left: 4,
            right: 0,
            bottom: 150,
            child: Center(
              child: Image.asset(
                'lib/assests/logo.png',
                width: 240,
                height: 240,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        toolbarHeight: 20,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('lib/assests/homebg.png'),
                alignment: Alignment.center,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Opacity(
              opacity: 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 80),
                      Center(
                        child: Text(
                          "GlyphGateway",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Username',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                            labelText: 'Password',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 380,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assests/logo.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print("hello");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(240, 50)),
                ),
                child: const Text('Login'),
              ),
            ),
          ),
          const Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Register Now?',
                style: TextStyle(
                  color: Colors.teal,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.teal,
                  decorationStyle: TextDecorationStyle.solid,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Continue Without Login',
                style: TextStyle(
                  color: Colors.teal,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.teal,
                  decorationStyle: TextDecorationStyle.solid,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        toolbarHeight: 20,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('lib/assests/homebg.png'),
                alignment: Alignment.center,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Opacity(
              opacity: 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 80),
                      Center(
                        child: Text(
                          "GlyphGateway",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Colors.black,
                            labelText: 'Email',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.black,
                            labelText: 'Username',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                            prefixIconColor: Colors.black,
                            suffixIconColor: Colors.black,
                            labelText: 'Password',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                            prefixIconColor: Colors.black,
                            suffixIconColor: Colors.black,
                            labelText: 'Confirm Password',
                            // hintText: 'hint text',
                            //helperText: 'supporting text',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 530,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assests/logo.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print("hello");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(240, 50)),
                ),
                child: const Text('Register'),
              ),
            ),
          ),
          const Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Already have an account? ',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.teal,
                  decorationStyle: TextDecorationStyle.solid,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Continue Without Login',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.teal,
                  decorationStyle: TextDecorationStyle.solid,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
