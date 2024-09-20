import 'package:flutter/material.dart';
import 'package:moneyexpense/system/app.dart';

class BaseColor {
  static var primary = _color(Apps.primaryCode);
  static var yellow = _color("F2C94C");
  static var blue1 = _color("2F80ED");
  static var blue2 = _color("2D9CDB");
  static var blue3 = _color("56CCF2");
  static var purple1 = _color("9B51E0");
  static var orange = _color("F2994A");
  static var purple2 = _color("BB6BD9");
  static var red = _color("EB5757");
  static var green2 = _color("46B5A7");
}

Color _color(var code) {
  return Color(int.parse("0xff$code"));
}
