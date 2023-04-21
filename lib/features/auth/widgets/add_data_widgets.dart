import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/widgets/small_text_field_widget.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/neu_dark_container_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Widget> addDataList = [
      TextFieldWidget(
        controller: nameController,
        labelHint: StringsManager.nameHint,
        obscureText: false,
        keyboardType: TextInputType.text,
      ),
      TextFieldWidget(
        controller: surnameController,
        labelHint: StringsManager.surnameHint,
        obscureText: false,
        keyboardType: TextInputType.text,
      ),
      TextFieldWidget(
        controller: ageController,
        labelHint: StringsManager.ageHint,
        obscureText: false,
        keyboardType: TextInputType.number,
      ),
      Row(
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
      NeuButton(
        width: SizeManager.s400,
        height: SizeManager.s70,
        radius: RadiusManager.r15,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            dropdownDecoration: BoxDecoration(
              color: ColorManager.darkGrey,
              borderRadius: BorderRadius.circular(
                RadiusManager.r15,
              ),
            ),
            onChanged: onChangedGender,
            value: valueGender,
            iconSize: SizeManager.s0,
            hint: const Text(
              StringsManager.genderHint,
              style: StyleManager.registerTextfieldTextStyle,
            ),
            items: const [
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
      NeuButton(
        width: SizeManager.s400,
        height: SizeManager.s70,
        radius: RadiusManager.r15,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            dropdownDecoration: BoxDecoration(
              color: ColorManager.darkGrey,
              borderRadius: BorderRadius.circular(
                RadiusManager.r15,
              ),
            ),
            onChanged: onChangedActivity,
            value: valueActivity,
            iconSize: SizeManager.s0,
            hint: const Text(
              StringsManager.activityHint,
              style: StyleManager.registerTextfieldTextStyle,
            ),
            items: const [
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
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: addDataList,
    );
  }
}
