import 'package:flutter/material.dart';
import 'package:finhub/firebase_auth/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoading = false;

  handleSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.value.text;
      final password = passwordController.value.text;
      _isLoading = true;
      await Auth().signInWithEmailAndPassword(email, password, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30, top: 40),
              child: Column(
                children: [
                  const Text(
                    "Sign In",
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
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "Please enter your email address and password to login",
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
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter email address",
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
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(height: 25),
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
                              hintText: "Enter password",
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
                              contentPadding: EdgeInsets.all(20),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                //979797
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
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4246B7),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                        // Future.delayed(
                        //   const Duration(seconds: 2),
                        //   () {
                        //     setState(() {
                        //       _isLoading = false;
                        //     });
                        //     Navigator.pushNamed(context, "/savings_screen");
                        //   },
                        // );
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
                              'Sign In',
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
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Not yet registerd?',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
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
