import 'package:finhub/components/plan_summary_row.dart';
import 'package:flutter/material.dart';

class LoanCalculator extends StatefulWidget {
  LoanCalculator({Key? key});

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  bool _isLoading = false;
  double _loanDuration = 1.5; // Initial loan duration value
  double _loanAmount = 4000000; // Initial loan amount value
  final double _minLoanAmount = 3000000;
  final double _maxLoanAmount = 5000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: const Color(0xFF2B5BBA),
            child: Stack(
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
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        'Loan Calculator',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Let's Calculate your loan",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Please select the amount you want and duration and we shall automatically calculate for you the total amount to pay back",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loan Amount",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 4,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF9CB3DF),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: ((_loanAmount - _minLoanAmount) /
                                        (_maxLoanAmount - _minLoanAmount)) *
                                    340 -
                                20,
                            child: Column(
                              children: [
                                Text(
                                  'UGX ${_loanAmount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 0,
                            child: Text(
                              'UGX ${_minLoanAmount.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            right: 0,
                            child: Text(
                              'UGX ${_maxLoanAmount.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onHorizontalDragUpdate:
                                (DragUpdateDetails details) {
                              setState(() {
                                // Calculate the loan amount based on the horizontal drag position
                                double dragPosition = details.localPosition.dx;
                                if (dragPosition < 0) dragPosition = 0;
                                if (dragPosition > 340) dragPosition = 340;
                                _loanAmount = _minLoanAmount +
                                    (dragPosition / 340) *
                                        (_maxLoanAmount - _minLoanAmount);
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 340,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loan Duration",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 4,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF9CB3DF),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: (_loanDuration / 2) * 340 - 20,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    _loanDuration.toStringAsFixed(1) + ' years',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 60,
                            left: 0,
                            child: Text(
                              '0 years',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 60,
                            right: 0,
                            child: Text(
                              '2 years',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onHorizontalDragUpdate:
                                (DragUpdateDetails details) {
                              setState(() {
                                // Calculate the loan duration based on the horizontal drag position
                                _loanDuration =
                                    (details.localPosition.dx / 340) * 2;
                                if (_loanDuration < 0) _loanDuration = 0;
                                if (_loanDuration > 2) _loanDuration = 2;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 340,
                              color: Colors.transparent,
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
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                    height: 20,
                  ),
                  SizedBox(
                    width: 349,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context)
                              .pushReplacementNamed('/loan_summary');
                          setState(() {
                            _isLoading = false;
                          });
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
          ),
        ],
      ),
    );
  }
}
