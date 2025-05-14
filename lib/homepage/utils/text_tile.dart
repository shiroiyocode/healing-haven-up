import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String Texttile;
  final Color colorWhat;
  final FontWeight? fontweightWhat;
  final double? fontsizeWhat;
  final TextAlign? txtAlign;

  const TextTile({
    super.key,
    required this.Texttile,
    required this.colorWhat,
    this.fontsizeWhat,
    this.fontweightWhat,
    this.txtAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Texttile,
      style: TextStyle(
        color: colorWhat,
        fontWeight: fontweightWhat,
        fontSize: fontsizeWhat,
      ),
      textAlign: txtAlign,
    );
  }
}
