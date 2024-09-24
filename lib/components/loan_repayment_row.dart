import 'package:flutter/material.dart';

class LoanRepaymentRow extends StatelessWidget {
  final String dateText;
  final String amountText;
  final String type;

  LoanRepaymentRow(
      {required this.dateText, required this.amountText, required this.type});

  @override
  Widget build(BuildContext context) {
    return type == 'not_paid'
        ? GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/loan_repayment");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleWithStick(type),
                Text(
                  dateText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF433D3D),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  amountText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircleWithStick(type),
              Text(
                dateText,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF433D3D),
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                amountText,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
  }
}

class StickPainter extends CustomPainter {
  final Color color;
  final Offset start;
  final Offset end;

  StickPainter({required this.color, required this.start, required this.end});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    final centerX = size.width / 2;
    final startY = size.height;
    final bottomCenter = Offset(centerX, startY);

    canvas.drawLine(bottomCenter + start, bottomCenter + end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget _buildCircleWithStick(String type) {
  return Container(
    width: 27,
    height: 27,
    decoration: type == 'paid'
        ? const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2B5BBA),
          )
        : BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Color(0xFF828282),
              width: 2.0,
            ),
          ),
    child: CustomPaint(
      painter: StickPainter(
        color: type == 'paid' ? Color(0xFF2B5BBA) : Color(0xFF828282),
        start: Offset(0, 0), // Adjusted start offset
        end: Offset(0, 15), // Adjusted end offset
      ),
    ),
  );
}
