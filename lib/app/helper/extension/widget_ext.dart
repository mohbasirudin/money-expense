import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget expanded() {
    return Expanded(child: this);
  }

  Widget padding(EdgeInsets? value) {
    return Padding(
      padding: value ?? EdgeInsets.zero,
      child: this,
    );
  }

  Widget onTap(Function() tap) {
    return GestureDetector(
      onTap: tap,
      child: this,
    );
  }
}
