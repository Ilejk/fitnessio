import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/settings/widgets/change_password_app_bar.dart';
import 'package:smart_home_app/features/settings/providers/settings_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/neu_dark_container_widget.dart';

class ChangeGoalsPage extends StatefulWidget {
  const ChangeGoalsPage({super.key});

  @override
  State<ChangeGoalsPage> createState() => _ChangeGoalsPageState();
}

class _ChangeGoalsPageState extends State<ChangeGoalsPage> {
  String? _valueGoals;
  void _onChangedGoals(Object? selectedGoalsValue) {
    if (selectedGoalsValue is String) {
      setState(() {
        _valueGoals = selectedGoalsValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    Future<void> changeGoals() async {}

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60,
        ),
        child: ChangeDataPagesAppBar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(PaddingManager.p28),
                child: Text(
                  StringsManager.changeGoalsText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWightManager.bold,
                    letterSpacing: SizeManager.s3,
                    fontSize: FontSize.s25,
                  ),
                ),
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
                    onChanged: _onChangedGoals,
                    value: _valueGoals,
                    iconSize: SizeManager.s0,
                    hint: const Text(
                      StringsManager.goalHint,
                      style: StyleManager.registerTextfieldTextStyle,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: StringsManager.lose,
                        child: Text(
                          StringsManager.loseWeightHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.maintain,
                        child: Text(
                          StringsManager.maintainWeightHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.gain,
                        child: Text(
                          StringsManager.gainWeightHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: changeGoals,
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
