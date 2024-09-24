import 'package:flutter/material.dart';

class CongratulationsPage extends StatefulWidget {
  const CongratulationsPage({super.key});

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'images/Verification-success.png',
                  width: 168,
                  height: 132,
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Congratulations for completing your transaction successfully',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF2B5BBA),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 349,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      // Simulating verification process
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context)
                            .pushReplacementNamed('/bottom_nav');
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
                                color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
