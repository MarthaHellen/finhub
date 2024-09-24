import 'package:flutter/material.dart';
import 'package:finhub/components/loan_package_card.dart';

class LoanPackages extends StatefulWidget {
  LoanPackages({Key? key});

  @override
  State<LoanPackages> createState() => _LoanPackagesState();
}

class _LoanPackagesState extends State<LoanPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
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
            margin: const EdgeInsets.all(20),
            child: Column(
              children: const [
                SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Loan Packages',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF050901),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select from our popular packages",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA0A0A0),
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                LoanPackageCard(
                  imagePath: 'images/securityuser.png',
                  title: 'Students Super',
                  interestRate: '3%',
                  amount: 'UGX 1,000,000',
                  backgroundColor: Color(0xFFF43A3A),
                ),
                SizedBox(
                  height: 30,
                ),
                LoanPackageCard(
                  imagePath: 'images/usertag.png',
                  title: 'Students Max',
                  interestRate: '3%',
                  amount: 'UGX 5,000,000',
                  backgroundColor: Color(0xFF02AF71),
                ),
                SizedBox(
                  height: 30,
                ),
                LoanPackageCard(
                  imagePath: 'images/taguser.png',
                  title: 'Students Max Pro',
                  interestRate: '3%',
                  amount: 'UGX 10,000,000',
                  backgroundColor: Color(0xFF2B5BBA),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
