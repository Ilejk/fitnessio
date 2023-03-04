import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex('#37ED1A');
  static Color darkPrimary = HexColor.fromHex('#85CC74');
  static Color primaryWithOppacity = HexColor.fromHex('#C737ED1A');
  static Color lighGreyWithOppacity = HexColor.fromHex('#C4808080');
  static Color blackWithOppacity = HexColor.fromHex('#B8000000');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color whiteWithOppacity = HexColor.fromHex('#66FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
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
