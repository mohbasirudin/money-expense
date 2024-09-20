import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/widget/text.dart';

class SubMainByCategory extends StatefulWidget {
  const SubMainByCategory({super.key});

  @override
  State<SubMainByCategory> createState() => _SubMainByCategoryState();
}

class _SubMainByCategoryState extends State<SubMainByCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CText(
          ConstString.expenseByCategory,
          fontWeight: FontWeight.w700,
        ).padding(
          const EdgeInsets.all(
            ConsPadding.large,
          ),
        ),
      ],
    );
  }
}
