import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTxt;
  final Color color;
  final Color splashcolor;
  final Color txtColor;
  Mybutton({
    super.key,
    required this.onTap,
    required this.buttonTxt,
    required this.color,
    required this.splashcolor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          splashColor: color.withValues(alpha: 1),
          child: Container(
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: splashcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                buttonTxt,
                style: TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
