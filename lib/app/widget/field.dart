import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextInputType? type;
  final Function(String value)? onChanged;

  const CField({
    this.padding,
    this.hint = "",
    this.suffix,
    this.preffix,
    this.readOnly = false,
    this.controller,
    this.type,
    this.onChanged,
    super.key,
  });

  @override
  State<CField> createState() => _CFieldState();
}

class _CFieldState extends State<CField> {
  @override
  Widget build(BuildContext context) {
    var formatters = <TextInputFormatter>[];
    if (widget.type == TextInputType.number) {
      formatters = [
        CurrencyTextInputFormatter.simpleCurrency(
          locale: "id",
          decimalDigits: 0,
        ),
      ];
    }
    return TextField(
      inputFormatters: formatters,
      controller: widget.controller,
      cursorColor: BaseColors.primary,
      keyboardType: widget.type ?? TextInputType.text,
      textInputAction: TextInputAction.done,
      onChanged: widget.onChanged,
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
