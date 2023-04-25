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
        TextFieldWidget(
          controller: emailController,
          labelHint: StringsManager.emailHint,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
        ),
        TextFieldWidget(
          controller: passwordController,
          labelHint: StringsManager.passwordHint,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
        ),
        isRegisterView
            ? TextFieldWidget(
                controller: repeatPasswordController,
                labelHint: StringsManager.repeatPasswordHint,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              )
            : Container(),
      ],
    );
  }
}
