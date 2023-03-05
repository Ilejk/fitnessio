import 'package:fitnessio/presentation/resources/managers/color_manager.dart';
import 'package:fitnessio/presentation/resources/managers/font_manager.dart';
import 'package:fitnessio/presentation/resources/managers/styles_manager.dart';
import 'package:fitnessio/presentation/resources/managers/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.darkPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.primaryWithOppacity,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryWithOppacity,
      titleTextStyle: getRegularTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.darkGrey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryWithOppacity,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          letterSpacing: 0.0,
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: getSemiBoldTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      subtitle1: getMediumTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      subtitle2: getMediumTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      caption: getRegularTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.darkGrey,
      ),
      bodyText1: getRegularTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.grey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      hintStyle: getRegularTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.darkGrey,
      ),
      labelStyle: getMediumTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.darkGrey,
      ),
      errorStyle: getRegularTextStyle(
        letterSpacing: 0.0,
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
    ),
  );
}
