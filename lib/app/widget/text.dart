import 'package:flutter/material.dart';

class CText extends StatefulWidget {
  final String text;

  const CText(this.text, {super.key});

  @override
  State<CText> createState() => _CTextState();
}

class _CTextState extends State<CText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
    );
  }
}
