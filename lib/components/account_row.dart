import 'package:flutter/material.dart';

class AccountRow extends StatelessWidget {
  final String imagePath;
  final Color containerColor;
  final String text;
  final String navigationRoute;

  AccountRow({
    required this.imagePath,
    required this.containerColor,
    required this.text,
    required this.navigationRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: containerColor.withOpacity(0.2),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF433D3D),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Transform.scale(
          scale: 1.6,
          child: IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              Navigator.pushNamed(context, navigationRoute);
            },
            color: const Color(0xFF433D3D).withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
