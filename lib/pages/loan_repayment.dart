import 'package:flutter/material.dart';

class LoanRepayment extends StatefulWidget {
  LoanRepayment({Key? key});

  @override
  State<LoanRepayment> createState() => _LoanRepaymentState();
}

class _LoanRepaymentState extends State<LoanRepayment> {
  bool _isLoading = false;

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
                  'Loan Repayment',
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
            margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "You're making repayment for month 4. Your monthly payment of UGX 250,000 will be debited from your account",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF050901),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
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
                Navigator.of(context)
                    .pushReplacementNamed('/payment_method');
                setState(() {
                  //
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
    );
  }
}
