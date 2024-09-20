import 'package:flutter/material.dart';
import 'package:moneyexpense/app/widget/text.dart';

class PageError extends StatefulWidget {
  final String message;

  const PageError({
    this.message = "Failed, try again!",
    super.key,
  });

  @override
  State<PageError> createState() => _PageErrorState();
}

class _PageErrorState extends State<PageError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CText(
        widget.message,
      ),
    );
  }
}
