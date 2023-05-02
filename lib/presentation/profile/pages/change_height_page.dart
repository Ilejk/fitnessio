import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/home/providers/home_provider.dart';
import 'package:smart_home_app/presentation/settings/widgets/change_password_app_bar.dart';
import 'package:smart_home_app/presentation/settings/providers/settings_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class ChangeHeightPage extends StatefulWidget {
  const ChangeHeightPage({super.key});

  @override
  State<ChangeHeightPage> createState() => _ChangeHeightPageState();
}

class _ChangeHeightPageState extends State<ChangeHeightPage> {
  final TextEditingController _heightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();

    super.dispose();
  }

  Future<void> changeHeight() async {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    try {
      await homeProvider
          .getUsersBMI(
              height: double.parse(_heightController.text),
              weight: homeProvider.userData['weight'])
          .then((_) => homeProvider.getUsersBMR(
                gender: homeProvider.userData['gender'],
                weight: homeProvider.userData['weight'],
                height: double.parse(_heightController.text),
                age: homeProvider.userData['age'],
                activity: homeProvider.userData['activity'],
                goal: homeProvider.userData['goal'],
              ))
          .then((_) => settingsProvider.changeUsersHeight(
              bmi: homeProvider.usersBMI,
              bmr: homeProvider.userBMRwithGoal,
              height: double.parse(_heightController.text),
              context: context))
          .then((_) => Navigator.of(context).pop());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60.h,
        ),
        child: const ChangeDataPagesAppBar(),
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
                  StringsManager.changeHeightText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWightManager.bold,
                    letterSpacing: SizeManager.s3,
                    fontSize: FontSize.s25.sp,
                  ),
                ),
              ),
              TextFieldWidget(
                controller: _heightController,
                labelHint: StringsManager.heightHint,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: changeHeight,
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
}
