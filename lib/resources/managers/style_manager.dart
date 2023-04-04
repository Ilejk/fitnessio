import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/managers/color_manager.dart';
import 'package:smart_home_app/resources/managers/font_manager.dart';
import 'package:smart_home_app/resources/managers/value_manager.dart';

class StyleManager {
  static const splashText1TextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s35,
    fontWeight: FontWightManager.bold,
  );
  static const splashText2TextStyle = TextStyle(
    color: ColorManager.lighGrey,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.semiBold,
  );
  static const loginPageSubButtonSmallTextStyle = TextStyle(
    color: ColorManager.limeGreen,
    fontSize: FontSize.s16,
    fontWeight: FontWightManager.medium,
    letterSpacing: SizeManager.s0_7,
  );
  static const loginPageForgotPasswordTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s13,
    fontWeight: FontWightManager.medium,
    letterSpacing: SizeManager.s0_7,
  );
  static const registerPageHaveAccTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s13,
    fontWeight: FontWightManager.medium,
    letterSpacing: SizeManager.s0_7,
  );
}