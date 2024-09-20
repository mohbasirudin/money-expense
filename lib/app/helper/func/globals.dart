import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/widget/text.dart';

void snackbar(BuildContext context, bool success) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CText(success ? ConstString.success : ConstString.failed),
      duration: const Duration(seconds: 1),
      backgroundColor: success ? BaseColors.green2 : BaseColors.red,
    ),
  );
}
