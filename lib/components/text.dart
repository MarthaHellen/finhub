import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const Text1({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: controller,        
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA8CAEA)),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFA8CAEA))),
      ),
    );
  }
}
