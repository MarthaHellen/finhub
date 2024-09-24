import 'package:flutter/material.dart';

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8CAEA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,              
              children: [
                Image.asset(
                  'images/ic_launcher.png',
                  fit: BoxFit.contain,
                  // Adjust the height as needed
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'FIN',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF2B2B46),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'HUB',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF2B5BBA),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Grow As One',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'We Are A Multi-University And Loaning Entity',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 18.15 / 13,
              ),
            ),
            const Text(
              'Learn More >>>',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF2B5BBA),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 18.15 / 13,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start A Financial Oriented Journey With Us',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 18.15 / 13,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'To Utilize Our Saving, Investment, Loaning And The Personalized Financial Literacy Services With',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                height: 18.15 /
                    13, // Calculate line height by dividing line height (18.15px) by font size (15px)
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Fellow Students From All Universities in Africa',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 18.15 / 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(                
                backgroundColor: const Color(0xFF2B5BBA),
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 16), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Button border radius
                ),

              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Don't Have An Account?",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 18.15 / 13,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                  Navigator.pushNamed(context, '/create_account');
                },
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2B5BBA),
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  height: 18.15 / 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
