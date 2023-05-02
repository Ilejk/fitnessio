import 'package:flutter/material.dart';

class ColorManager {
  static const Color black = Colors.black;
  static const Color black54 = Colors.black54;
  static const Color black87 = Colors.black87;
  static const Color white = Colors.white;
  static const Color red = Color.fromARGB(255, 207, 14, 0);
  static const Color yellow = Color.fromARGB(255, 255, 162, 0);
  static const Color white2 = Color.fromARGB(255, 207, 203, 203);
  static const Color lighGrey = Color.fromARGB(255, 116, 115, 115);
  static const Color limeGreen = Color.fromARGB(255, 175, 231, 78);
  static const Color darkGrey = Color.fromARGB(255, 21, 21, 21);
  static const Color grey = Color.fromARGB(255, 99, 98, 98);
  static Color grey3 = HexColor.fromHex('#242A2E');
  static Color limerGreen2 = HexColor.fromHex('#BBF247');
  static Color drinkDarkGrey = HexColor.fromHex('#252325');
  static final Color grey2 = Colors.grey.shade800;
  static const Color blue = Color.fromARGB(255, 46, 202, 245);
  static const Color brightThemeGrey = Color.fromARGB(255, 175, 178, 159);
  static const Color orange = Color.fromARGB(255, 204, 77, 14);
  static const Color orange2 = Color.fromARGB(67, 224, 103, 42);
  static const Color limeGreenOp = Color.fromARGB(73, 175, 231, 78);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
