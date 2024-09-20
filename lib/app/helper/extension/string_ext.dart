import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';

extension StrExt on String {
  String lower() {
    try {
      return toLowerCase();
    } catch (e) {
      return this;
    }
  }

  Color color() {
    try {
      return Color(int.parse("0xff$this"));
    } catch (e) {
      return BaseColors.primary;
    }
  }

  String _capitalized() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return this;
    }
  }

  String currency() {
    try {
      return lower().replaceAll("rp", "").replaceAll(".", "");
    } catch (e) {
      return "0";
    }
  }

  String toCapitalized() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str._capitalized())
        .join(' ');
  }
}
