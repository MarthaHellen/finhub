import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NewSavingPlan extends StatefulWidget {
  const NewSavingPlan({Key? key}) : super(key: key);

  @override
  State<NewSavingPlan> createState() => NewSavingPlanState();
}

class NewSavingPlanState extends State<NewSavingPlan> {
  late TextEditingController _planNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _planNameController = TextEditingController();
  }

  @override
  void dispose() {
    _planNameController.dispose();
    super.dispose();
  }

  void submitPlan() async {
  final planName = _planNameController.value.text;
  final prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> plan = {
      'name': planName,
      'amount': 0,
      'frequency': "",
      'lockStatus': '', 
      'start_date': '', 
      'withdraw_date': '', 
      'interest_rate': '3%', 
    };
  prefs.setString('plan', jsonEncode(plan));

  // Navigate to the next screen
  Navigator.pushNamed(context, "/savings_frequency");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  color: const Color(0xFF2B5BBA),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'NEW SAVING PLAN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Let's set up your saving plan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Questrial',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _planNameController,
                        cursorColor: const Color(0xFF2B5BBA),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Plan name",
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
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'The plan will help you save in a simple and convenient manner. Give this plan a creative name.',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA0A0A0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 250),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            submitPlan();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2B5BBA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
