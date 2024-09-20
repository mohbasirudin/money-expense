import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/widget/text.dart';

class PageEmpty extends StatefulWidget {
  final double? height;
  final String? message;

  const PageEmpty({
    this.height,
    this.message,
    super.key,
  });

  @override
  State<PageEmpty> createState() => _PageEmptyState();
}

class _PageEmptyState extends State<PageEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ConstNum.radius * 0.5,
        ),
        border: Border.all(
          width: 1,
          color: BaseColors.outline,
        ),
      ),
      child: Center(
        child: CText(
          widget.message ?? ConstString.empty,
        ),
      ),
    );
  }
}
