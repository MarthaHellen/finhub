import 'package:flutter/material.dart';
import 'package:finhub/components/plan_summary_row.dart';

class LoanBreakdown extends StatefulWidget {
  LoanBreakdown({Key? key});

  @override
  State<LoanBreakdown> createState() => _LoanBreakdownState();
}

class _LoanBreakdownState extends State<LoanBreakdown> {
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
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Loan Breakdown',
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
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
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF2B5BBA),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
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
                          keyText: "Amount taken", valueText: "UXG 4,000,000"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Amount paid", valueText: "UXG 1,000,000"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Months covered", valueText: "4 months"),
                      const SizedBox(height: 20),
                      const PlanSummaryRow(
                          keyText: "Months remaining", valueText: "15 months"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "UGX 3,350,000",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
