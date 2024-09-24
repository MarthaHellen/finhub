import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LockStatus extends StatefulWidget {
  const LockStatus({super.key});

  @override
  State<LockStatus> createState() => LockStatusState();
}

class LockStatusState extends State<LockStatus> {
  String _selectedLockStatus = '';
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    final lockStatus = _selectedLockStatus;
    final prefs = await SharedPreferences.getInstance();
    final planString = prefs.getString('plan');
    if (_selectedLockStatus == 'Locked') {
      if (planString != null) {
        Map<String, dynamic> plan = jsonDecode(planString);
        plan['lockStatus'] = lockStatus;

        prefs.setString('plan', jsonEncode(plan)); // Update the stored plan

        print(plan);
      }

      // Navigate to the next screen (replace '/savings_complete' with the correct route)
      Navigator.pushNamed(context, "/saving_duration");
    }else{
      if (planString != null) {
        Map<String, dynamic> plan = jsonDecode(planString);
        plan['lockStatus'] = lockStatus;

        prefs.setString('plan', jsonEncode(plan)); // Update the stored plan

        print(plan);
      }

      // Navigate to the next screen (replace '/savings_complete' with the correct route)
      Navigator.pushNamed(context, "/saving_duration_unlocked");
    }
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
                  padding: const EdgeInsets.all(10.0),
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
                                'LOCK STATUS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Do you want to lock this savings account?",
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
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        activeColor: const Color(0xFF2B5BBA),
                        title: const Text(
                          'Lock with Interest',
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontFamily: 'Questrial',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 'Locked',
                        groupValue: _selectedLockStatus,
                        onChanged: (value) {
                          setState(() {
                            _selectedLockStatus = value.toString();
                          });
                        },
                      ),
                      RadioListTile<String>(
                        activeColor: const Color(0xFF2B5BBA),
                        title: const Text(
                          "Don't Lock",
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontFamily: 'Questrial',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: "Unlocked",
                        groupValue: _selectedLockStatus,
                        onChanged: (value) {
                          setState(() {
                            _selectedLockStatus = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 250),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    submit();
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
        ],
      ),
    );
  }
}
