import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Register();
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
                        offset: Offset(0, 3),
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
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: const Text(
                  'Already Have an account?',
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
          ),
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  print('Continue Without Login pressed');
                },
                child: const Text(
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
          ),
        ],
      ),
    );
  }
}
