import 'package:fitnessio/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color color, double letterSpacing) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    letterSpacing: letterSpacing,
  );
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.regular,
    color,
    letterSpacing,
  );
}

TextStyle getLightTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.light,
    color,
    letterSpacing,
  );
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.bold,
    color,
    letterSpacing,
  );
}

TextStyle getBoldMainTitleTextStyle(
    {double fontSize = FontSize.s75,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.bold,
    color,
    letterSpacing,
  );
}

TextStyle getMainButtonTextStyle(
    {double fontSize = FontSize.s40,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.bold,
    color,
    letterSpacing,
  );
}

TextStyle getSemiBoldMainSubTitleTextStyle(
    {double fontSize = FontSize.s20,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.semiBold,
    color,
    letterSpacing,
  );
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.semiBold,
    color,
    letterSpacing,
  );
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required double letterSpacing}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWightManager.medium,
    color,
    letterSpacing,
  );
}
