import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';

class CField extends StatefulWidget {
  final EdgeInsets? padding;
  final String hint;
  final Widget? suffix;
  final Widget? preffix;
  final bool readOnly;
  final TextEditingController? controller;

  const CField({
    this.padding,
    this.hint = "",
    this.suffix,
    this.preffix,
    this.readOnly = false,
    this.controller,
    super.key,
  });

  @override
  State<CField> createState() => _CFieldState();
}

class _CFieldState extends State<CField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: BaseColors.primary,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.sourceSansPro,
      ),
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(
          ConsPadding.medium,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: BaseColors.hint,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.sourceSansPro,
        ),
        border: _border(),
        disabledBorder: _border(),
        enabledBorder: _border(),
        errorBorder: _border(),
        focusedBorder: _border(),
        focusedErrorBorder: _border(),
        //   icon
        suffixIcon: widget.suffix,
        prefixIcon: widget.preffix,
      ),
    ).padding(widget.padding);
    // return Container(
    //   margin: widget.padding,
    //   padding: const EdgeInsets.all(
    //     ConsPadding.medium,
    //   ),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(
    //       ConstNum.radius * 0.5,
    //     ),
    //     border: Border.all(
    //       color: BaseColors.outline,
    //       width: 1,
    //     ),
    //   ),
    //   child: TextField(
    //     decoration: InputDecoration(
    //       hintText: widget.hint,
    //       hintStyle: TextStyle(
    //         color: BaseColors.hint,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       isCollapsed: true,
    //       border: _border(),
    //       disabledBorder: _border(),
    //       enabledBorder: _border(),
    //       errorBorder: _border(),
    //       focusedBorder: _border(),
    //       focusedErrorBorder: _border(),
    //     ),
    //   ),
    // );
  }

  InputBorder _border({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(ConstNum.radius * 0.5),
        borderSide: BorderSide(
          color: color ?? BaseColors.outline,
          width: 1,
        ),
      );
}
