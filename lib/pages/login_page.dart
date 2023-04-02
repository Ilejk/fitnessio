import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/asset_manager.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/font_manager.dart';
import 'package:smart_home_app/resources/string_manager.dart';
import 'package:smart_home_app/resources/style_manager.dart';
import 'package:smart_home_app/resources/value_manager.dart';
import 'package:smart_home_app/resources/widgets/green_gradient_button_widget.dart';
import 'package:smart_home_app/resources/widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: PaddingManager.p30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: PaddingManager.p20),
                child: SizedBox(
                  width: SizeManager.s300,
                  height: SizeManager.s350,
                  child: Image.asset(
                    ImageManager.logoTextUnder,
                  ),
                ),
              ),
              EmailTextFormField(
                width: SizeManager.s400,
                controller: emailController,
                labelHint: StringsManager.emailHint,
                obscureText: false,
              ),
              EmailTextFormField(
                width: SizeManager.s400,
                controller: passwordController,
                labelHint: StringsManager.passwordHint,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: PaddingManager.p28, right: PaddingManager.p28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        //TODO
                      },
                      child: const Text(
                        StringsManager.forgotPassword,
                        style: StyleManager.loginPageForgotPasswordTextStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO
                      },
                      child: const Text(
                        StringsManager.signUp,
                        style: StyleManager.loginPageSignUpSmallTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: PaddingManager.p100),
                child: GreenGradientButtonWidget(
                  onTap: () {
                    //TODO LOG IN
                  },
                  title: StringsManager.signIn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
