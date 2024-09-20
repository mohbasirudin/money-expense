import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/assets.dart';

class CText extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CText(
    this.text, {
    this.color,
    this.fontWeight,
    this.fontSize,
    super.key,
  });

  @override
  State<CText> createState() => _CTextState();
}

class _CTextState extends State<CText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize ?? 14.0,
        fontFamily: FontFamily.sourceSansPro,
      ),
    );
  }
}
