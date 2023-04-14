import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/auth/widgets/text_form_field_auth.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

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
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: emailController,
        labelHint: StringsManager.emailHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: passwordController,
        labelHint: StringsManager.passwordHint,
        obscureText: true,
      ),
    ];
    List<Widget> registerChildren = [
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: emailController,
        labelHint: StringsManager.emailHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: passwordController,
        labelHint: StringsManager.passwordHint,
        obscureText: true,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: repeatPasswordController,
        labelHint: StringsManager.repeatPasswordHint,
        obscureText: true,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: nameController,
        labelHint: StringsManager.nameHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: surnameController,
        labelHint: StringsManager.surnameHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: ageController,
        labelHint: StringsManager.ageHint,
        obscureText: false,
      ),
      const Text(
        StringsManager.measurment,
        style: TextStyle(color: ColorManager.white),
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: heightController,
        labelHint: StringsManager.heightHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: weightController,
        labelHint: StringsManager.weightHint,
        obscureText: false,
      ),
      DropdownButtonHideUnderline(
        child: DropdownButton2(
          onChanged: onChanged,
          value: value,
          hint: const Text(StringsManager.genderHint),
          items: const [
            DropdownMenuItem(
              value: StringsManager.man,
              child: Text(StringsManager.man),
            ),
            DropdownMenuItem(
              value: StringsManager.woman,
              child: Text(StringsManager.woman),
            ),
          ],
        ),
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: armController,
        labelHint: StringsManager.armHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: chestController,
        labelHint: StringsManager.chestHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: waistController,
        labelHint: StringsManager.waistHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
        controller: hipController,
        labelHint: StringsManager.hipHint,
        obscureText: false,
      ),
      TextFormFieldWidget(
        width: SizeManager.s400,
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
