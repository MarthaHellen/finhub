import 'package:flutter/material.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:email_otp/email_otp.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:finhub/pages/student_provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final studentNumberController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final universityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _isLoading = false;

  String selectedValue = 'Makerere University';
  List<String> universities = [
    'Makerere University',
    'Kyambogo University',
    'Uganda Christian University',
    'ISBAT',
  ];

  // handleSubmit(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     final email = emailController.value.text;
  //     final password = passwordController.value.text;
  //     _isLoading = true;
  //     await Auth().registerWithEmailAndPassword(email, password, context);
  //   }
  // }

  // void handleSubmit(BuildContext context) async {
  //   // Create a MongoDB connection instance
  //   final mongo.Db db = mongo.Db('mongodb://localhost:27017/finhub');
  //   // final email = emailController.value.text;
  //   // final password = passwordController.value.text;

  //   const email = "emmakatwebaze@gmail.com";
  //   const password = "12345678";

  //   // final student = {
  //   //   'email': email,
  //   //   'password': password,
  //   //   'full_name': fullnameController.value.text,
  //   //   'phone_number': phoneNumberController.value.text,
  //   //   'student_number': studentNumberController.value.text,
  //   //   'university': selectedValue,
  //   // };

  //   final student = {
  //     'email': "emmakatwebaze@gmail.com",
  //     'password': "12345678",
  //     'full_name': "Katwebaze Emmanuel",
  //     'phone_number': "07771217",
  //     'student_number': "210019921",
  //     'university': "Makerere University",
  //   };

  //   print(student);

  //   try {
  //     // Open the MongoDB connection
  //     await db.open();

  //     // Insert the user data into the 'students' collection
  //     final studentsCollection = db.collection('students');
  //     await studentsCollection.insert(student);

  //     // Close the MongoDB connection
  //     await db.close();

  //     _isLoading = true;
  //     await Auth().registerWithEmailAndPassword(email, password, context);
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle the error, show a snackbar, dialog, or other UI indication
  //   }
  // }

  void handleSubmit(BuildContext context) async {
    // Create a MongoDB connection instance
    if (_formKey.currentState!.validate()) {
      final email = emailController.value.text;
      final password = passwordController.value.text;

      final student = {
        'email': email,
        'password': password,
        'full_name': fullnameController.value.text,
        'phone_number': phoneNumberController.value.text,
        'student_number': studentNumberController.value.text,
        'university': selectedValue,
        'status': "unsubscribed"
      };

      print(student);
         final prefs = await SharedPreferences.getInstance();
        prefs.setString('student', jsonEncode(student));

    EmailOTP myauth = EmailOTP();

      try {
        myauth.setConfig(
          appEmail: "finhub@gmail.com",
          appName: "FinHuB",
          userEmail: email,
          otpLength: 4,
          otpType: OTPType.digitsOnly);

          if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("OTP has been sent")));
      Navigator.pushNamed(context, "/verify_account");
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Oops OTP not sent")));
    }

        final studentRef = await FirebaseFirestore.instance
            .collection('students')
            .add(student);

        final String userId = studentRef.id;

        Provider.of<StudentProvider>(context, listen: false).studentId = userId;

        // Register user with Auth
        _isLoading = true;
        await Auth().registerWithEmailAndPassword(email, password, context);
      } catch (e) {
        print("Error saving data to Firestore: $e");
      }
    }
  }
  // void handleSubmit(BuildContext context) async {
  //   // Create a MongoDB connection instance
  //   // final email = emailController.value.text;
  //   // final password = passwordController.value.text;

  //   const email = "emmakatwebaze@gmail.com";
  //   const password = "12345678";

  //   final student = {
  //     'email': "emmakatwebaze@gmail.com",
  //     'password': "12345678",
  //     'full_name': "Katwebaze Emmanuel",
  //     'phone_number': "07771217",
  //     'student_number': "210019921",
  //     'university': "Makerere University",
  //   };
  //   final prefs = await SharedPreferences.getInstance();
  //       prefs.setString('student', jsonEncode(student));

  //   EmailOTP myauth = EmailOTP();

  //   try {
  //     myauth.setConfig(
  //         appEmail: "finhub@gmail.com",
  //         appName: "FinHuB",
  //         userEmail: "omojo2001@gmail.com",
  //         otpLength: 4,
  //         otpType: OTPType.digitsOnly);
  //   } catch (e) {
  //     print("Error saving data to Firestore: $e");
  //   }

  //   if (await myauth.sendOTP() == true) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("OTP has been sent")));
  //     Navigator.pushNamed(context, "/verify_account");
  //   }else{
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("Oops OTP not sent")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 30,
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
              margin: const EdgeInsets.only(right: 30, left: 30, top: 40),
              child: Column(
                children: [
                  const Text(
                    "Sign Up",
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "Please enter your email address and password to sign up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            controller: fullnameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Full name",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Email address",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            controller: studentNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your student number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Student number",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Color(0xFFEBEBEB), size: 40),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF433D3D),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: universities
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF828282),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF979797),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            cursorColor: const Color(0xFF4246B7),
                            controller: confirmpasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password for confirmation';
                              }
                              return null;
                            },
                            obscureText: _obscureText2,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF828282),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCDCDCD)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                                child: Icon(
                                  _obscureText2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF979797),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 349,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        //handleSubmit(context);
                        setState(() {
                          _isLoading = true;
                        });

                        handleSubmit(context);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        );
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
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            Navigator.pushNamed(context, "/sign_in");
                          },
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already Have An Account?',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
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
      ),
    );
  }
}
