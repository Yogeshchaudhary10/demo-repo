import 'package:flutter/material.dart';

class ColorManager {
  static Color kPrimaryColor = HexColor.fromHex("#f57f17");
  static Color kSecondaryColor = HexColor.fromHex("#ff5722");
  static Color kTextColor = HexColor.fromHex("#141619");
  static Color kButtonColor = HexColor.fromHex("#112537");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opactiy 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
