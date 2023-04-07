import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/providers/forgot_password_provider.dart';
import 'package:smart_home_app/features/auth/widgets/text_form_field_auth.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/green_gradient_button_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: AppBar(
        backgroundColor: ColorManager.darkGrey,
        elevation: SizeManager.s0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: PaddingManager.p28),
              child: Center(
                child: Text(
                  StringsManager.enterEmailToResetPw,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWightManager.semiBold,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ),
            TextFormFieldWidget(
              width: SizeManager.s400,
              controller: emailController,
              labelHint: StringsManager.emailHint,
              obscureText: false,
            ),
            LimeGreenRoundedButtonWidget(
              onTap: () {
                forgotPasswordProvider.forgotPassword(
                  email: emailController.text,
                  context: context,
                );
              },
              title: StringsManager.resetPassword,
            )
          ],
        ),
      ),
    );
  }
}
