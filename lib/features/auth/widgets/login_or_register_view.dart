import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/neu_dark_container_widget.dart';

// ignore: must_be_immutable
class LoginOrRegisterView extends StatelessWidget {
  LoginOrRegisterView({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.isRegisterView,
    required this.repeatPasswordController,
    required this.nameController,
    required this.surnameController,
    required this.ageController,
    required this.heightController,
    required this.armController,
    required this.chestController,
    required this.hipController,
    required this.waistController,
    required this.weightController,
    required this.thighController,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegisterView;
  final TextEditingController repeatPasswordController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController armController;
  final TextEditingController waistController;
  final TextEditingController hipController;
  final TextEditingController chestController;
  final TextEditingController thighController;
  Object? value;
  void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    List<Widget> loginChildren = [
      TextFieldWidget(
        controller: emailController,
        labelHint: StringsManager.emailHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: passwordController,
        labelHint: StringsManager.passwordHint,
        obscureText: true,
      ),
    ];
    List<Widget> registerChildren = [
      TextFieldWidget(
        controller: emailController,
        labelHint: StringsManager.emailHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: passwordController,
        labelHint: StringsManager.passwordHint,
        obscureText: true,
      ),
      TextFieldWidget(
        controller: repeatPasswordController,
        labelHint: StringsManager.repeatPasswordHint,
        obscureText: true,
      ),
      TextFieldWidget(
        controller: nameController,
        labelHint: StringsManager.nameHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: surnameController,
        labelHint: StringsManager.surnameHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: ageController,
        labelHint: StringsManager.ageHint,
        obscureText: false,
      ),
      const Padding(
        padding: EdgeInsets.only(
          top: PaddingManager.p12,
          bottom: PaddingManager.p20,
        ),
        child: Text(
          StringsManager.measurment,
          textAlign: TextAlign.center,
          style: StyleManager.registerSpacerStyle,
        ),
      ),
      TextFieldWidget(
        controller: heightController,
        labelHint: StringsManager.heightHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: weightController,
        labelHint: StringsManager.weightHint,
        obscureText: false,
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
            onChanged: onChanged,
            value: value,
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
      TextFieldWidget(
        controller: armController,
        labelHint: StringsManager.armHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: chestController,
        labelHint: StringsManager.chestHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: waistController,
        labelHint: StringsManager.waistHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: hipController,
        labelHint: StringsManager.hipHint,
        obscureText: false,
      ),
      TextFieldWidget(
        controller: thighController,
        labelHint: StringsManager.thighHint,
        obscureText: false,
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: isRegisterView ? registerChildren : loginChildren,
    );
  }
}
