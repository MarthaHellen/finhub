import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  bool _isLoading = false;
  late String otpNumber;
  var student;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  EmailOTP myauth = EmailOTP();

  void verifyEmail() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    // Calculate the combined OTP number
    final otpNumber = _controller1.text.trim() +
        _controller2.text.trim() +
        _controller3.text.trim() +
        _controller4.text.trim();

    print("Entered OTP: $otpNumber");
    myauth.setConfig(
          appEmail: "finhub@gmail.com",
          appName: "FinHuB",
          userEmail: "omojo2001@gmail.com",
          otpLength: 4,
          otpType: OTPType.digitsOnly);

    bool isOtpValid = await myauth.verifyOTP(otp: int.parse(otpNumber));
    if (isOtpValid) {
      final prefs = await SharedPreferences.getInstance();
      final studentString = prefs.getString('student');
      if (studentString != null) {
        student = jsonDecode(studentString);
        print(student);
      } else {
        Navigator.pushNamed(context, "/sign_up");
      }

      print(student.email);
      try {
        await FirebaseFirestore.instance.collection('students').add(student);

        // Register user with Auth
        await Auth().registerWithEmailAndPassword(
            student.email, student.password, context);

        // Show success dialog after a delay
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
            _showVerifyDialog(context);
          });
        });
      } catch (e) {
        print("Error saving data to Firestore: $e");
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP. Please check and try again.")));
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF2B5BBA).withOpacity(0.29),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(width: 70,),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Verify",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/finhub_icon.png',
                      fit: BoxFit.contain,
                      height: 100,
                      // Adjust the height as needed
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Verify Your Account',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "We've sent a verification code to example@gmail.com. Check your email and enter the code below",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                controller: _controller1,
                                cursorColor: const Color(0xFF4246B7),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                controller: _controller2,
                                cursorColor: const Color(0xFF4246B7),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                controller: _controller3,
                                cursorColor: const Color(0xFF4246B7),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                controller: _controller4,
                                cursorColor: const Color(0xFF4246B7),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 349,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          _showVerifyDialog(context);
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
                                'Verify',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Haven't received a code yet?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Resend',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4246B7),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showVerifyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/Verification-success.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                'Account Verified Successfully',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF2B5BBA),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 349,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_saving_account');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B5BBA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF4246B7),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: const Text('Proceed'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
