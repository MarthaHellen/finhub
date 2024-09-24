import 'package:flutter/material.dart';
import 'package:finhub/components/plan_summary_row.dart';

class LoanReceived extends StatefulWidget {
  LoanReceived({Key? key});

  @override
  State<LoanReceived> createState() => _LoanReceivedState();
}

class _LoanReceivedState extends State<LoanReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
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
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Loan Received',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF050901),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "The loan you applied for has been disbursed to your account number 12673628434, Centenary Bank. Please check to confirm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF828282),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "This is the summary of the Loan",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2B5BBA),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFE7E7E8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const PlanSummaryRow(
                          keyText: "Package", valueText: "Student Max"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Loan Amount", valueText: "UXG 4,000,000"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Duration", valueText: "1.5 years"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Interest", valueText: "3%"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Monthly payments",
                          valueText: "3% per annum"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Lock Status", valueText: "Locked"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "TOTAL PAYABLE",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "UGX 4,350,000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                RichText(
                  text: const TextSpan(
                    text: "Haven't received yet? call our customer care on ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF433D3D),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: '02832878474',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4246B7),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
