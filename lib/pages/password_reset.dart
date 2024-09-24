import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  bool _isLoading = false;
  final usernameController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final universityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        const SizedBox(width: 8.0),
                        const Text(
                          'Password Reset',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/edit2.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextFormField(
                  cursorColor: const Color(0xFF4246B7),
                  controller: currentPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: "Current password",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF828282),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCDCDCD)),
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
                        _obscureText ? Icons.visibility_off : Icons.visibility,
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
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF828282),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCDCDCD)),
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
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
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
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  obscureText: _obscureText3,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF828282),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText3 = !_obscureText3;
                        });
                      },
                      child: Icon(
                        _obscureText3 ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF979797),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
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
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B5BBA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Save',
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
