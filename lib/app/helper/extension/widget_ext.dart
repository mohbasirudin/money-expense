import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget expanded() {
    return Expanded(child: this);
  }

  Widget padding(EdgeInsets value) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
