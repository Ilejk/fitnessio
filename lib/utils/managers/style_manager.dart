import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

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
  static final loginPageSubButtonSmallTextStyle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s16,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s0_7,
  );
  static const loginPageSubTextTextStyle = TextStyle(
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
  static const myAccTitleTextStyle = TextStyle(
    fontSize: FontSize.s25,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s3,
  );
  static const forgotPWErrorTextStyle = TextStyle(
    fontSize: FontSize.s16,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s3,
    color: ColorManager.white,
  );
  static const forgotPWErrorContentTextStyle = TextStyle(
    fontSize: FontSize.s13,
    fontWeight: FontWightManager.regular,
    letterSpacing: SizeManager.s1,
    color: ColorManager.white,
  );
  static const appbarTitleTextStyle = TextStyle(
    fontSize: FontSize.s25,
    fontWeight: FontWeight.bold,
    letterSpacing: SizeManager.s5,
    color: ColorManager.white,
  );
}
