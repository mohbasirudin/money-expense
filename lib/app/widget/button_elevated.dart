import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/widget/text.dart';

class ButtonElevated extends StatefulWidget {
  final String text;
  final EdgeInsets? padding;
  final Function()? onTap;
  final bool enabled;

  const ButtonElevated(
    this.text, {
    this.padding,
    this.onTap,
    this.enabled = true,
    super.key,
  });

  @override
  State<ButtonElevated> createState() => _ButtonElevatedState();
}

class _ButtonElevatedState extends State<ButtonElevated> {
  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? BaseColors.primary : BaseColors.outline,
        ),
        onPressed: enabled
            ? () {
                if (widget.onTap != null) {
                  print("tapp");
                  widget.onTap!();
                }
              }
            : null,
        child: CText(
          widget.text,
          color: BaseColors.light,
          fontWeight: FontWeight.w700,
          fontSize: FontSize.large,
        ),
      ),
    ).padding(
      widget.padding,
    );
  }
}
