import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Navigator.of(context).pushReplacementNamed('/savings_screen');
        } else {
          Navigator.of(context).pushReplacementNamed('/onboarding');
        }
      });
    });
    // Timer(const Duration(seconds: 4), () {
    //   Navigator.of(context).pushReplacementNamed('/onboarding');
    // });
  }

  @override
  Widget build(BuildContext context) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double logicalPixels = 268 / devicePixelRatio;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/finhub_icon.png',
              fit: BoxFit.contain,
              height: 120,
              // Adjust the height as needed
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'FIN',
                  style: TextStyle(
                      fontSize: 35,
                      color: Color(0xFF050901),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'HUB',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xFF4246B7),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Grow As One',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF9B9AAC),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
