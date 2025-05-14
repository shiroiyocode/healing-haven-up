import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String Imagepath;
  const SquareTile({super.key, required this.Imagepath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.brown.shade200),
          borderRadius: BorderRadius.circular(12),
          color: Colors.brown.shade100,
        ),
        child: Image.asset(Imagepath, height: 40),
      ),
    );
  }
}
