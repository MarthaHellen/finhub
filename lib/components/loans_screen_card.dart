import 'package:flutter/material.dart';

class LoansScreenCard extends StatelessWidget {
  final Color color;
  final Color dotColor;
  final String imageUrl;
  final String text;
  final String route;

  const LoansScreenCard({
    required this.color,
    required this.dotColor,
    required this.imageUrl,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: CustomPaint(
          painter: DottedBackgroundPainter(
            dotColor: dotColor,
            backgroundColor: color,
            dotRadius: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 37,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  final Color dotColor;
  final Color backgroundColor;
  final double dotRadius;

  DottedBackgroundPainter({
    required this.dotColor,
    required this.backgroundColor,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;
    final dotPaint = Paint()..color = dotColor;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    canvas.drawCircle(const Offset(20, 20), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(DottedBackgroundPainter oldDelegate) {
    return dotColor != oldDelegate.dotColor ||
        backgroundColor != oldDelegate.backgroundColor ||
        dotRadius != oldDelegate.dotRadius;
  }
}
