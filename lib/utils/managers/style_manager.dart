import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class StyleManager {
  static final splashText1TextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s35.sp,
    fontWeight: FontWightManager.bold,
  );
  static final splashText2TextStyle = TextStyle(
    color: ColorManager.lighGrey,
    fontSize: FontSize.s18.sp,
    fontWeight: FontWightManager.semiBold,
  );
  static final loginPageSubButtonSmallTextStyle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s16.sp,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s0_7,
  );
  static final loginPageSubTextTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s13.sp,
    fontWeight: FontWightManager.medium,
    letterSpacing: SizeManager.s0_7,
  );
  static final registerPageHaveAccTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s13.sp,
    fontWeight: FontWightManager.medium,
    letterSpacing: SizeManager.s0_7,
  );
  static final abTitleTextStyle = TextStyle(
    fontSize: FontSize.s25.sp,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s3,
  );
  static final forgotPWErrorTextStyle = TextStyle(
    fontSize: FontSize.s16.sp,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s3,
    color: ColorManager.white,
  );
  static final forgotPWErrorContentTextStyle = TextStyle(
    fontSize: FontSize.s13.sp,
    fontWeight: FontWightManager.regular,
    letterSpacing: SizeManager.s1,
    color: ColorManager.white,
  );
  static final appbarTitleTextStyle = TextStyle(
    fontSize: FontSize.s25.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: SizeManager.s5,
    color: ColorManager.white,
  );
  static final accountButtonTextStyle = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s18.sp,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s1_5,
  );
  static final settingsButtonTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s17.sp,
    fontWeight: FontWightManager.regular,
    letterSpacing: SizeManager.s1,
  );
  static final registerSpacerStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s17.sp,
    fontWeight: FontWightManager.semiBold,
    letterSpacing: SizeManager.s1_5,
  );
  static final registerTextfieldTextStyle = TextStyle(
    color: ColorManager.limeGreen,
    fontSize: FontSize.s14.sp,
    letterSpacing: SizeManager.s1_5,
    fontWeight: FontWightManager.semiBold,
  );
  static final settingsPageSpacerTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s22.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: SizeManager.s0_5,
  );
  static final deleteAccPopUpButtonTextStyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.bold,
    fontSize: FontSize.s25.sp,
    letterSpacing: SizeManager.s3,
  );
  static final deleteAccPopUpTitleTextStyle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s20.sp,
    fontWeight: FontWightManager.semiBold,
  );
  static final homePageS17BoldWhite = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s17.sp,
    fontWeight: FontWightManager.bold,
  );
  static final homePageS20BoldWhite = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s20.sp,
    fontWeight: FontWightManager.bold,
  );
  static final homePageS12RegularWhite2 = TextStyle(
    color: ColorManager.white2,
    fontSize: FontSize.s12.sp,
    fontWeight: FontWightManager.regular,
  );
  static final homePageTextSpacerTextStyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.semiBold,
    fontSize: FontSize.s25.sp,
    letterSpacing: SizeManager.s1,
  );
  static final homePageS18BoldDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s18.sp,
    fontWeight: FontWightManager.bold,
  );
  static final homePageS20BoldDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s35.sp,
    fontWeight: FontWightManager.bold,
  );
  static final homePageS16RegularDarkGrey = TextStyle(
    color: ColorManager.darkGrey,
    fontSize: FontSize.s16.sp,
    fontWeight: FontWightManager.regular,
  );
  static final homePageCarouselTitle = TextStyle(
    color: ColorManager.limerGreen2,
    fontSize: FontSize.s35.sp,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s1,
  );
  static final homePageS14RegularWhite2L1 = TextStyle(
    color: ColorManager.white2,
    fontWeight: FontWightManager.regular,
    fontSize: FontSize.s14.sp,
    letterSpacing: SizeManager.s1,
  );
  static final homePagePogressBarTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s18.sp,
    fontWeight: FontWightManager.semiBold,
  );
  static final homePageTodaysProgressTextSTyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWightManager.bold,
    fontSize: FontSize.s22.sp,
    letterSpacing: SizeManager.s1,
  );
  static final drinkPageTextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s35.sp,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s1,
  );
  static final newExerciseButtonTextSTyle = TextStyle(
    fontSize: FontSize.s25.sp,
    fontWeight: FontWightManager.bold,
    letterSpacing: SizeManager.s3,
    color: ColorManager.darkGrey,
  );
  static final weightProfTextSTyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s13.sp,
    fontWeight: FontWightManager.semiBold,
  );
}
