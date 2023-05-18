import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/settings/providers/settings_provider.dart';
import 'package:smart_home_app/presentation/settings/widgets/change_email_app_bar.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_underlined.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _oldEmailController.dispose();
    _newEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    Future<void> changeEmail() async {
      if (isValid) {
        try {
          await settingsProvider.changeEmail(
            context: context,
            oldEmail: _oldEmailController.text,
            newEmail: _newEmailController.text,
            password: _passwordController.text,
          );
        } catch (e) {
          rethrow;
        }
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60.h,
        ),
        child: const ChangeEmailPageAppBar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p28),
                child: Text(
                  StringsManager.changeEmailContent,
                  textAlign: TextAlign.center,
                  style: StyleManager.settingsOptionTiteTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  bottom: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _oldEmailController,
                  labelHint: StringsManager.oldEmailHint,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  bottom: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _newEmailController,
                  labelHint: StringsManager.newEmailHint,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  bottom: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _passwordController,
                  labelHint: StringsManager.passwordHint,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: changeEmail,
                title: StringsManager.procede,
              )
            ],
          ),
        ),
      )),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }

  bool get isValid {
    return _oldEmailController.text.isNotEmpty ||
        _newEmailController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty ||
        _oldEmailController != _newEmailController;
  }
}
