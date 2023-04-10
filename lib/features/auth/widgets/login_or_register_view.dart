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
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegisterView;
  final TextEditingController repeatPasswordController;

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
      ],
    );
  }
}
