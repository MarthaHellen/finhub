import 'package:flutter/material.dart';

class LoanPackageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String interestRate;
  final String amount;
  final Color backgroundColor; // New parameter for background color

  const LoanPackageCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.interestRate,
    required this.amount,
    required this.backgroundColor, // Initialize the new parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      padding: const EdgeInsets.all(15.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE7E7E8),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA0A0A0).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      color: backgroundColor
                          .withOpacity(0.2), // Use the new parameter
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      imagePath,
                      height: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF433D3D),
                      fontSize: 20,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 78,
                height: 27,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/loan_calculator");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B5BBA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Apply',
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
          const Divider(
            color: Color(0xFFA0A0A0),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                interestRate,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Interest',
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontSize: 16,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Maximum amount',
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontSize: 16,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
