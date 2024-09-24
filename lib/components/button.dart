import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final Function()? onTouch;
  const Button({super.key ,required this.onTouch});
  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap:onTouch,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin:const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),

        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );}}