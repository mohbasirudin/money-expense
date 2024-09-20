import 'package:flutter/material.dart';
import 'package:moneyexpense/system/app.dart';

class BaseColors {
  static var primary = _color(ColorsCode.primary);
  static var yellow = _color(ColorsCode.yellow);
  static var blue1 = _color(ColorsCode.blue1);
  static var blue2 = _color(ColorsCode.blue2);
  static var blue3 = _color(ColorsCode.blue3);
  static var purple1 = _color(ColorsCode.purple1);
  static var orange = _color(ColorsCode.orange);
  static var purple2 = _color(ColorsCode.purple2);
  static var red = _color(ColorsCode.red);
  static var green2 = _color(ColorsCode.green2);
  static var light = Colors.white;
  static var gray3 = _color(ColorsCode.gray3);
}

class ColorsCode {
  static var primary = Apps.primaryCode;
  static var yellow = "F2C94C";
  static var blue1 = "2F80ED";
  static var blue2 = "2D9CDB";
  static var blue3 = "56CCF2";
  static var purple1 = "9B51E0";
  static var orange = "F2994A";
  static var purple2 = "BB6BD9";
  static var red = "EB5757";
  static var green2 = "46B5A7";
  static var gray3 = "828282";
}

Color _color(var code) {
  return Color(int.parse("0xff$code"));
}
