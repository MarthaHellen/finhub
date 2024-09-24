import 'package:flutter/material.dart';

class PlanSummaryRow extends StatelessWidget {
  final String keyText;
  final String valueText;

  const PlanSummaryRow({
    required this.keyText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keyText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          valueText,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF2B5BBA),
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
