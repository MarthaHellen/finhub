import 'package:flutter/material.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Verification-success.png',
              width: 126,
              height: 126,
            ),
            const SizedBox(height: 20),
            const Text(
              'Successful',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Color(0xFF2B5BBA),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Your loan request has been successfully submitted. '
                'Please wait for approval and disbursement to your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6D6D),
                ),
              ),
            ),
            // Expanded(
            //   child: SizedBox(),
            // ),
            //const SizedBox(height: 300),
          ],
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          width: 349,
          height: 54,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              // Simulating verification process
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.of(context).pushReplacementNamed('/bottom_nav');
                setState(() {
                  //
                });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B5BBA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Go back to home',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
