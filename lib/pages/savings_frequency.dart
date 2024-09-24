import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SavingsFrequency extends StatefulWidget {
  const SavingsFrequency({super.key});

  @override
  State<SavingsFrequency> createState() => SavingsFrequencyState();
}

class SavingsFrequencyState extends State<SavingsFrequency> {
  late TextEditingController _amountController;
  String _selectedFrequency = '';
  final _formKey = GlobalKey<FormState>();
  var plan;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void submit() async {
    final amount = _amountController.value.text;
    final frequency = _selectedFrequency;
    final prefs = await SharedPreferences.getInstance();
    final planString = prefs.getString('plan');

    if (planString != null) {
      Map<String, dynamic> plan = jsonDecode(planString);
      plan['amount'] = amount;
      plan['frequency'] = frequency;

      prefs.setString('plan', jsonEncode(plan)); // Update the stored plan

      print(plan);
    }

    // Navigate to the next screen (replace '/savings_complete' with the correct route)
    Navigator.pushNamed(context, "/lock_status");
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
                  padding: const EdgeInsets.all(10),
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
                                'SAVINGS FREQUENCY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "How frequently would you like to save for this plan?",
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        activeColor: const Color(0xFF2B5BBA),
                        title: const Text(
                          'Daily',
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontFamily: 'Questrial',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 'Daily',
                        groupValue: _selectedFrequency,
                        onChanged: (value) {
                          setState(() {
                            _selectedFrequency = value.toString();
                          });
                        },
                      ),
                      RadioListTile<String>(
                        activeColor: const Color(0xFF2B5BBA),
                        title: const Text(
                          'Weekly',
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontFamily: 'Questrial',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 'Weekly',
                        groupValue: _selectedFrequency,
                        onChanged: (value) {
                          setState(() {
                            _selectedFrequency = value.toString();
                          });
                        },
                      ),
                      RadioListTile<String>(
                        activeColor: const Color(0xFF2B5BBA),
                        title: const Text(
                          'Monthly',
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontFamily: 'Questrial',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 'Monthly',
                        groupValue: _selectedFrequency,
                        onChanged: (value) {
                          setState(() {
                            _selectedFrequency = value.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Amount to save ',
                            style: TextStyle(
                              color: Color(0xFF433D3D),
                              fontFamily: 'Questrial',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _amountController,
                              cursorColor: const Color(0xFF2B5BBA),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Amount",
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF828282),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD9D9D9)),
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
                            const SizedBox(height: 50),
                            Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                      ),
                    ],
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
