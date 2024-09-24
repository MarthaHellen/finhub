import 'package:flutter/material.dart';
import 'package:finhub/firebase_auth/auth.dart';

class BankDetails extends StatefulWidget {
  BankDetails({Key? key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final emailController = TextEditingController();
  final banknameController = TextEditingController();
  final accountNameController = TextEditingController();
  final amountToSaveController = TextEditingController();
  final universityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _isLoading = false;

  handleSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //
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
              margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bank Details',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fill in your bank details",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account Number",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF433D3D),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF4246B7),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter account number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "e.g 18923983292",
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
                              borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account name",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF433D3D),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF4246B7),
                          controller: accountNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your account name';
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "e.g Josephine",
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
                              borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Amount to save",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF433D3D),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF4246B7),
                          keyboardType: TextInputType.number,
                          controller: amountToSaveController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your amount to save';
                            }
                            return null;
                          },
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                            hintText: "eg 40000",
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
                              borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
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
                          Navigator.pushNamed(context, "/congratulations");
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
                              'Proceed',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.chevron_left),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
