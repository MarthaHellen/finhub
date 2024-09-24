import 'package:flutter/material.dart';
import 'package:finhub/pages/bottom_nav.dart';

class SavingScreen extends StatefulWidget {
  const SavingScreen({Key? key}) : super(key: key);

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    "images/avatar@3x.png",
                    width: 85,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome, Martha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "What's your reason for using ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF433D3D),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'FinHub',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2B5BBA),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' today?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170.0,
                      height: 98.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigation(selectedIndex: 1),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0xFF2B5BBA),
                                width: 3.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 5.0,
                                  left: 5.0,
                                  child: Container(
                                    width: 15.0,
                                    height: 15.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFF2B5BBA),
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/iconsaxbulkdollarsquare@3x.png",
                                        height: 40,
                                      ),
                                      const SizedBox(width: 5.0),
                                      const Text(
                                        "Save",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xFF433D3D),
                                          fontFamily: 'Questrial',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170.0,
                      height: 98.0,
                      child: InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, '/');
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/iconsaxbulkbox1@3x.png",
                                  height: 40,
                                ),
                                const SizedBox(width: 5.0),
                                const Text(
                                  "Invest",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170.0,
                      height: 98.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigation(selectedIndex: 2),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/iconsaxbulkbriefcase@3x.png",
                                  height: 40,
                                ),
                                const SizedBox(width: 5.0),
                                const Text(
                                  "Loan",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170.0,
                      height: 98.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/withdraw');
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/withdrawal.png",
                                  height: 30,
                                ),
                                const SizedBox(width: 5.0),
                                const Text(
                                  "Withdraw",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 355.0,
                  height: 98.0,
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/');
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/iconsaxbulkemptywallettime@3x.png",
                            width: 30.0,
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            "Financial Knowledge",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF433D3D),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bottom_nav');
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
                        'Go to home',
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
    );
  }
}
