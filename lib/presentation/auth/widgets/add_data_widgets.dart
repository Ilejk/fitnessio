import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_app/utils/widgets/small_text_field_widget.dart';
import 'package:smart_home_app/utils/widgets/text_field_underlined.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

// ignore: must_be_immutable
class AddDataWidgets extends StatelessWidget {
  AddDataWidgets({
    Key? key,
    required this.ageController,
    required this.heightController,
    required this.weightController,
    required this.onChangedGender,
    required this.valueGender,
    required this.valueActivity,
    required this.onChangedActivity,
    required this.nameController,
    required this.surnameController,
    required this.onChangedGoal,
    required this.valueGoal,
  }) : super(key: key);

  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController surnameController;
  final TextEditingController nameController;

  Object? valueGender;
  void Function(Object?)? onChangedGender;
  Object? valueActivity;
  void Function(Object?)? onChangedActivity;
  Object? valueGoal;
  void Function(Object?)? onChangedGoal;

  @override
  Widget build(BuildContext context) {
    List<Widget> addDataList = [
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: TextFieldWidgetUnderLined(
          controller: nameController,
          labelHint: StringsManager.nameHint,
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: TextFieldWidgetUnderLined(
          controller: surnameController,
          labelHint: StringsManager.surnameHint,
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: TextFieldWidgetUnderLined(
          controller: ageController,
          labelHint: StringsManager.ageHint,
          obscureText: false,
          keyboardType: TextInputType.number,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
          top: PaddingManager.p12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallTextFieldWidget(
              controller: heightController,
              labelHint: StringsManager.heightHint,
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
            SmallTextFieldWidget(
              controller: weightController,
              labelHint: StringsManager.weightHint,
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: Container(
          width: SizeManager.s400.w,
          height: SizeManager.s50.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.limerGreen2,
                width: SizeManager.s0_7.h,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownDecoration: BoxDecoration(
                color: ColorManager.darkGrey,
                borderRadius: BorderRadius.circular(
                  RadiusManager.r15.r,
                ),
              ),
              onChanged: onChangedGender,
              value: valueGender,
              iconSize: SizeManager.s0,
              hint: Text(
                StringsManager.genderHint,
                style: StyleManager.registerTextfieldTextStyle,
              ),
              items: [
                DropdownMenuItem(
                  value: StringsManager.genderManHint,
                  child: Text(
                    StringsManager.genderManHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.genderWomanHint,
                  child: Text(
                    StringsManager.genderWomanHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: Container(
          width: SizeManager.s400.w,
          height: SizeManager.s50.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.limerGreen2,
                width: SizeManager.s0_7.h,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownDecoration: BoxDecoration(
                color: ColorManager.darkGrey,
                borderRadius: BorderRadius.circular(
                  RadiusManager.r15.r,
                ),
              ),
              onChanged: onChangedActivity,
              value: valueActivity,
              iconSize: SizeManager.s0,
              hint: Text(
                StringsManager.activityHint,
                style: StyleManager.registerTextfieldTextStyle,
              ),
              items: [
                DropdownMenuItem(
                  value: StringsManager.activityLowHint,
                  child: Text(
                    StringsManager.activityLowHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.activityLightHint,
                  child: Text(
                    StringsManager.activityLightHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.activityModerateHint,
                  child: Text(
                    StringsManager.activityModerateHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.activityHighHint,
                  child: Text(
                    StringsManager.activityHighHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.activityVeryHighHint,
                  child: Text(
                    StringsManager.activityVeryHighHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: PaddingManager.p28,
          right: PaddingManager.p28,
          bottom: PaddingManager.p12,
        ),
        child: Container(
          width: SizeManager.s400.w,
          height: SizeManager.s50.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.limerGreen2,
                width: SizeManager.s0_7.h,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownDecoration: BoxDecoration(
                color: ColorManager.darkGrey,
                borderRadius: BorderRadius.circular(
                  RadiusManager.r15.r,
                ),
              ),
              onChanged: onChangedGoal,
              value: valueGoal,
              iconSize: SizeManager.s0,
              hint: Text(
                StringsManager.goalHint,
                style: StyleManager.registerTextfieldTextStyle,
              ),
              items: [
                DropdownMenuItem(
                  value: StringsManager.lose,
                  child: Text(
                    StringsManager.loseWeightHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.maintain,
                  child: Text(
                    StringsManager.maintainWeightHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: StringsManager.gain,
                  child: Text(
                    StringsManager.gainWeightHint,
                    style: StyleManager.registerTextfieldTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: addDataList,
    );
  }
}
