import 'package:flutter/material.dart';
import 'package:smart_home_app/features/auth/widgets/text_form_field_auth.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class LoginOrRegisterView extends StatelessWidget {
  const LoginOrRegisterView({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.isRegisterView,
    required this.repeatPasswordController,
    required this.nameController,
    required this.surnameController,
    required this.ageController,
    required this.houseIdController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegisterView;
  final TextEditingController repeatPasswordController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController ageController;
  final TextEditingController houseIdController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        isRegisterView
            ? TextFormFieldWidget(
                width: SizeManager.s400,
                controller: repeatPasswordController,
                labelHint: StringsManager.repeatPasswordHint,
                obscureText: true,
              )
            : Container(),
        isRegisterView
            ? TextFormFieldWidget(
                width: SizeManager.s400,
                controller: nameController,
                labelHint: StringsManager.nameHint,
                obscureText: false,
              )
            : Container(),
        isRegisterView
            ? TextFormFieldWidget(
                width: SizeManager.s400,
                controller: surnameController,
                labelHint: StringsManager.surnameHint,
                obscureText: false,
              )
            : Container(),
        isRegisterView
            ? TextFormFieldWidget(
                width: SizeManager.s400,
                controller: ageController,
                labelHint: StringsManager.ageHint,
                obscureText: false,
              )
            : Container(),
        isRegisterView
            ? TextFormFieldWidget(
                width: SizeManager.s400,
                controller: houseIdController,
                labelHint: StringsManager.houseIdHint,
                obscureText: false,
              )
            : Container(),
      ],
    );
  }
}
