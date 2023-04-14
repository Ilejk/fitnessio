import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/settings/providers/settings_provider.dart';
import 'package:smart_home_app/features/settings/widgets/delete_account_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    Future<void> deleteAccount() async {
      if (isValid) {
        try {
          await settingsProvider.deleteUser(
              email: _emailController.text, password: _passwordController.text);
        } catch (e) {
          print(e);
        }
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60,
        ),
        child: DeleteAccountPageAppBar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeManager.s250,
                height: SizeManager.s250,
                child: Image.asset(
                  ImageManager.logo,
                ),
              ),
              TextFieldWidget(
                controller: _emailController,
                labelHint: StringsManager.emailHint,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _passwordController,
                labelHint: StringsManager.passwordHint,
                obscureText: true,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: deleteAccount,
                title: StringsManager.procede,
              )
            ],
          ),
        ),
      )),
    );
  }

  bool get isValid {
    return _emailController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty;
  }
}
