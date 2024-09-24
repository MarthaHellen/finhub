import 'package:flutter/material.dart';
import 'package:finhub/components/plan_summary_row.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class PlanSummary extends StatefulWidget {
  const PlanSummary({super.key});

  @override
  State<PlanSummary> createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {
  bool _isLoading = false;

  Map<String, dynamic> _planSummary = {};

  String? userId;

  Future<void> getStudentId() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('students')
              .where('email', isEqualTo: user.email)
              .get();
      print(user.email);
      if (snapshot.size > 0) {
        final DocumentSnapshot<Map<String, dynamic>> studentDoc =
            snapshot.docs.first;
        userId = studentDoc.id;
        print(studentDoc);
        print(studentDoc.id);
        print(userId);
      }
    }else{
      userId = null; 
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPlanSummary();
    _initializeData();
  }

  Future<void> _loadPlanSummary() async {
    final prefs = await SharedPreferences.getInstance();
    final plan = prefs.getString('plan');
    if (plan != null) {
      setState(() {
        _planSummary = jsonDecode(plan);
      });
    }
  }

  Future<void> _initializeData() async {
    await getStudentId(); // Wait for getStudentId() to complete
    
  }

  void createPlan() async {
    setState(() {
      _isLoading = true;
    });

    // Save plan summary to Firestore
    final CollectionReference plansCollection =
        FirebaseFirestore.instance.collection('plans');
    final CollectionReference withdrawCollection =
        FirebaseFirestore.instance.collection('withdraw');
    final CollectionReference savingCollection =
        FirebaseFirestore.instance.collection('saving');

    try {
      DocumentReference planDocRef = await plansCollection.add({
        'plan_name':  _planSummary['name'],
        'amount_saved': 0,
        'amount_per_frequency': _planSummary['amount'],
        'frequency': _planSummary['frequency'],
        'start_date': _planSummary['start_date'],
        'final_withdraw_date': _planSummary['start_date'],
        'interest_rate': _planSummary['interest_rate'],
        'account_status': _planSummary['lockStatus'],
      });

      

      print(userId);
      DocumentReference savingDocRef = await savingCollection.add({
        'student_id': userId,
        'plan_id': planDocRef.id,
      });

      setState(() {
        _isLoading = false;
      });

      Navigator.pushNamed(context, '/bottom_nav');
    } catch (error) {
      // Handle error
      print('Error saving plan: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            color: const Color(0xFF2B5BBA),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
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
                        const SizedBox(
                          height: 60,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PLAN SUMMARY',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Text(
                          "Please enter your mobile account number",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                PlanSummaryRow(
                    keyText: "Periodic Amount",
                    valueText: "UGX ${_planSummary['amount']}"),
                const SizedBox(height: 20),
                PlanSummaryRow(
                    keyText: "Frequency",
                    valueText: "${_planSummary['frequency']}"),
                const SizedBox(height: 20),
                PlanSummaryRow(
                    keyText: "Start Date",
                    valueText: "${_planSummary['start_date']}"),
                const SizedBox(height: 20),
                PlanSummaryRow(
                    keyText: "Withdraw Date",
                    valueText: "${_planSummary['withdraw_date']}"),
                const SizedBox(height: 20),
                PlanSummaryRow(
                    keyText: "Interest Rate",
                    valueText: "${_planSummary['interest_rate']}"),
                const SizedBox(height: 20),
                PlanSummaryRow(
                    keyText: "Lock Status",
                    valueText: "${_planSummary['lockStatus']}"),
                const SizedBox(
                  height: 150,
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
                        createPlan();
                        Navigator.pushNamed(context, '/bottom_nav');
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
                            'Confirm',
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
