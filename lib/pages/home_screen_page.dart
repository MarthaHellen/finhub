import 'package:flutter/material.dart';
import 'package:finhub/components/articles.dart';
import 'package:finhub/components/events_reminders.dart';
import 'package:finhub/components/badges.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finhub/pages/student_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  bool showEventsReminders = true;
  bool showArticles = false;
  bool _isBoxVisible = false; // State for visibility of additional options box

  void _toggleBoxVisibility() {
    setState(() {
      _isBoxVisible = !_isBoxVisible;
    });
  }

  void signout(BuildContext context) async {
    await Auth().signOut(context);
  }

  int totalAmountSaved = 0;

  void calculateTotalAmountSaved() async {
    final snapshot = await FirebaseFirestore.instance.collection('plans').get();
    snapshot.docs.forEach((doc) {
      final amountSaved = doc['amount_saved'] as int? ?? 0;
      setState(() {
        totalAmountSaved += amountSaved;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    calculateTotalAmountSaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EEF9),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (_isBoxVisible) {
                setState(() {
                  _isBoxVisible = false;
                });
              }
            },
            child: Container(
              color: const Color(0xFF2B5BBA),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'images/Logo-big.png',
                                            height: 50.0,
                                          ),
                                          const SizedBox(width: 8.0),
                                          const Text(
                                            "FinHub",
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xFFF1F1F1),
                                              fontFamily: 'Questrial',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.notifications),
                                                color: Colors.white,
                                                onPressed: () {
                                                  // Handle notifications button press
                                                },
                                              ),
                                              Positioned(
                                                top: 8.0,
                                                right: 8.0,
                                                child: Container(
                                                  width: 10.0,
                                                  height: 10.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 8.0),
                                          GestureDetector(
                                            onTap: _toggleBoxVisibility,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'images/avatar@3x.png'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "UGX $totalAmountSaved",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFFF1F1F1),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Available balance",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFF1F1F1),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Stack(
                                      children: const [
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                            value:
                                                0.65, // Set the progress value here (e.g., 0.65 for 65%)
                                            strokeWidth: 8,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xFF001948)),
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "65%",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Saving progress",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Target: Shs ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFD9D9D9),
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "5,000,000",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFD9D9D9),
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Saved: Shs ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFD9D9D9),
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "3,500,000",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFD9D9D9),
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isBoxVisible,
                        child: Positioned(
                          top: 70, // Adjust the position as needed
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildMenuItem("Welcome", () {
                                  Navigator.of(context)
                                      .pushNamed('/savings_screen');
                                }),
                                _buildMenuItem("Sign Out", () {
                                  signout(context);
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE9EEF9),
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
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Color(0xFFE9EEF9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Badge",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2B5BBA),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Badges(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 197,
                      height: 26,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showEventsReminders = true;
                            showArticles = false;
                          });
                        },
                        style: showEventsReminders
                            ? ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2B5BBA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )
                            : ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                        child: showEventsReminders
                            ? const Text(
                                'Events & Reminders',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Events & Reminders',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2B5BBA),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    SizedBox(
                      width: 97,
                      height: 26,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showEventsReminders = false;
                            showArticles = true;
                          });
                        },
                        style: showArticles
                            ? ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2B5BBA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )
                            : ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                        child: showArticles
                            ? const Text(
                                'Articles',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Articles',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2B5BBA),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (showEventsReminders) const EventsReminders(),
                if (showArticles) const Articles(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Questrial',
            color: Color(0xff828282),
          ),
        ),
      ),
    );
  }
}
