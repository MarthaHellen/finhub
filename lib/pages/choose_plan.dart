import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoosePlan extends StatefulWidget {
  ChoosePlan({Key? key});

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String selectedPlanId;
  String selectedValue = '';
  List<String> plans = [];

  @override
  void initState() {
    super.initState();
    _fetchPlans();
  }

  Future<void> _fetchPlans() async {
    final snapshot = await FirebaseFirestore.instance.collection('plans').get();
    setState(() {
      plans = snapshot.docs
          .map<String>((doc) => doc['plan_name'] as String)
          .toList();
      if (plans.isNotEmpty) {
        selectedValue = plans.first;
        selectedPlanId = snapshot.docs.first.id;
      }
    });
  }

  submit() async {
    setState(() {
      _isLoading = true;
    });

    // Save selected plan's ID to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedPlanId', selectedPlanId);

    // Simulating verification process
    Future.delayed(const Duration(seconds: 2), () async {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed('/plan_payment_method');
    });
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose Plan',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF050901),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Select the plan for which you want to save",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF828282),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: [
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
                                      color: Color(0xFFEBEBEB)),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF433D3D),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: plans.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'Questrial',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFBCBBBB),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 349,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          submit();
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
                                  color: Colors.white,
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
}
