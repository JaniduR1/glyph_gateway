import 'package:flutter/material.dart';

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
                  Colors.black.withOpacity(0.65),
                  BlendMode.darken,
                ),
              ),
            ),
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
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
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
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: const Text(
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
