import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool ObsecureText;
  final controller;
  final Widget? suffixIcon;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.ObsecureText,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.brown.shade100,
          hintText: hintText,
          filled: true,
          suffixIcon: suffixIcon,
        ),
        obscureText: ObsecureText,
      ),
    );
  }
}
