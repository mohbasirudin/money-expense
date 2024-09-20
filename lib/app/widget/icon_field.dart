import 'package:flutter/material.dart';

class IconField extends StatefulWidget {
  final String icon;
  final Color? color;

  const IconField(
    this.icon, {
    this.color,
    super.key,
  });

  @override
  State<IconField> createState() => _IconFieldState();
}

class _IconFieldState extends State<IconField> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.icon,
      color: widget.color,
    );
  }
}
