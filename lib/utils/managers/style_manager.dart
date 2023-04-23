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
  static const abTitleTextStyle = TextStyle(
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
  static const accountButtonTextStyle = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s1_5,
  );
  static const settingsButtonTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s17,
    fontWeight: FontWightManager.regular,
    letterSpacing: SizeManager.s1,
  );
  static const registerSpacerStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s17,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s1_5,
  );
  static const registerTextfieldTextStyle = TextStyle(
    color: ColorManager.limeGreen,
    fontSize: FontSize.s14,
    letterSpacing: SizeManager.s1_5,
    fontWeight: FontWightManager.semiBold,
  );
  static const settingsPageSpacerTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s22,
    fontWeight: FontWeight.bold,
    letterSpacing: SizeManager.s0_5,
  );
  static const deleteAccPopUpButtonTextStyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.bold,
    fontSize: FontSize.s25,
    letterSpacing: SizeManager.s3,
  );
  static final deleteAccPopUpTitleTextStyle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s20,
    fontWeight: FontWightManager.semiBold,
  );
  static const homePageS18BoldWhite = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.bold,
  );
  static const homePageS20BoldWhite = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s20,
    fontWeight: FontWightManager.bold,
  );
  static const homePageS12RegularWhite2 = TextStyle(
    color: ColorManager.white2,
    fontSize: FontSize.s12,
    fontWeight: FontWightManager.regular,
  );
  static const homePageTextSpacerTextStyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.semiBold,
    fontSize: FontSize.s25,
    letterSpacing: SizeManager.s1,
  );
  static const homePageS18BoldDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.bold,
  );
  static const homePageS20BoldDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s35,
    fontWeight: FontWightManager.bold,
  );
  static const homePageS16RegularDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s16,
    fontWeight: FontWightManager.regular,
  );
  static final homePageCarouselTitle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s35,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s1,
  );
  static const homePageS14RegularWhite2L1 = TextStyle(
    color: ColorManager.white2,
    fontWeight: FontWightManager.regular,
    fontSize: FontSize.s14,
    letterSpacing: SizeManager.s1,
  );
  static const homePagePogressBarTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.semiBold,
  );
  static const homePageTodaysProgressTextSTyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.bold,
    fontSize: FontSize.s22,
    letterSpacing: SizeManager.s1,
  );
  static const drinkPageTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s35,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s1,
  );
  static const newExerciseButtonTextSTyle = TextStyle(
    fontSize: FontSize.s25,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s3,
    color: ColorManager.darkGrey,
  );
}
