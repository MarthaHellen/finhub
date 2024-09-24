import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finhub/pages/student_provider.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  bool _isLoading = false;
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void paySubscription() async {
    setState(() {
      _isLoading = true;
    });
    
    final String userId =
        Provider.of<StudentProvider>(context, listen: false).studentId;
    final amount = 5000;
    final currentTime = FieldValue.serverTimestamp();

    // Update student's status and add payment record
    final studentRef =
        FirebaseFirestore.instance.collection('students').doc(userId);

    try {
      await studentRef.update({
        'status': 'subscribed',
      });

      await FirebaseFirestore.instance.collection('subscription_payments').add({
        'user_id': userId,
        'amount': amount,
        'timestamp': currentTime,
      });

      setState(() {
        _isLoading = false;
      });

      // Navigate to congratulations page
      Navigator.pushNamed(context, "/congratulations");
    } catch (e) {
      print("Error updating student record: $e");
      setState(() {
        _isLoading = false;
      });
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
                        'Enter Phone number',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF050901),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "Please enter your mobile account number",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
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
                      controller: phoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "e.g 0770000000",
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
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 349,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          paySubscription();
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
