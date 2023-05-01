import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/presentation/settings/widgets/change_password_app_bar.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/neu_dark_container_widget.dart';
import 'package:smart_home_app/utils/widgets/small_text_field_widget.dart';

class ChangeMeasurementsPage extends StatefulWidget {
  const ChangeMeasurementsPage({super.key});

  @override
  State<ChangeMeasurementsPage> createState() => _ChangeMeasurementsPageState();
}

class _ChangeMeasurementsPageState extends State<ChangeMeasurementsPage> {
  final TextEditingController _chestController = TextEditingController();
  final TextEditingController _shoulderController = TextEditingController();
  final TextEditingController _bicepsController = TextEditingController();
  final TextEditingController _foreArmController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _hipsController = TextEditingController();
  final TextEditingController _thighCotroller = TextEditingController();
  final TextEditingController _calfController = TextEditingController();

  String? _valueActivity;
  String? _valueGoals;

  void _onChangedActivity(Object? selectedActivityValue) {
    if (selectedActivityValue is String) {
      setState(() {
        _valueActivity = selectedActivityValue;
      });
    }
  }

  void _onChangedGoals(Object? selectedGoalsValue) {
    if (selectedGoalsValue is String) {
      setState(() {
        _valueGoals = selectedGoalsValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  StringsManager.changeMeasurementsText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWightManager.bold,
                    letterSpacing: SizeManager.s3,
                    fontSize: FontSize.s25,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextFieldWidget(
                    controller: _chestController,
                    labelHint: StringsManager.chest,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SmallTextFieldWidget(
                    controller: _shoulderController,
                    labelHint: StringsManager.shoulders,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextFieldWidget(
                    controller: _bicepsController,
                    labelHint: StringsManager.biceps,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SmallTextFieldWidget(
                    controller: _foreArmController,
                    labelHint: StringsManager.foreArm,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextFieldWidget(
                    controller: _waistController,
                    labelHint: StringsManager.waist,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SmallTextFieldWidget(
                    controller: _hipsController,
                    labelHint: StringsManager.hips,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextFieldWidget(
                    controller: _thighCotroller,
                    labelHint: StringsManager.thigh,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SmallTextFieldWidget(
                    controller: _calfController,
                    labelHint: StringsManager.calf,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  )
                ],
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
                    onChanged: _onChangedActivity,
                    value: _valueActivity,
                    iconSize: SizeManager.s0,
                    hint: const Text(
                      StringsManager.activityHint,
                      style: StyleManager.registerTextfieldTextStyle,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: StringsManager.activityLowHint,
                        child: Text(
                          StringsManager.activityLowHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.activityLightHint,
                        child: Text(
                          StringsManager.activityLightHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.activityModerateHint,
                        child: Text(
                          StringsManager.activityModerateHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.activityHighHint,
                        child: Text(
                          StringsManager.activityHighHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.activityVeryHighHint,
                        child: Text(
                          StringsManager.activityVeryHighHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                    ],
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
                onTap: () {
                  //TODO:
                },
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

// Future<void> changeActivity() async {
//     final settingsProvider =
//         Provider.of<SettingsProvider>(context, listen: false);
//     final homeProvider = Provider.of<HomeProvider>(context, listen: false);
//     try {
//       await homeProvider
//           .getUsersBMR(
//             gender: homeProvider.userData['gender'],
//             weight: homeProvider.userData['weight'],
//             height: homeProvider.userData['height'],
//             age: homeProvider.userData['age'],
//             activity: _valueActivity!,
//             goal: homeProvider.userData['goal'],
//           )
//           .then((_) => settingsProvider.changeUsersActivity(
//               bmr: homeProvider.userBMRwithGoal,
//               activity: _valueActivity!,
//               context: context))
//           .then((_) => Navigator.of(context).pop());
//     } catch (e) {
//       print(e);
//     }
//   }
// Future<void> changeGoals() async {
//     final settingsProvider =
//         Provider.of<SettingsProvider>(context, listen: false);
//     final homeProvider = Provider.of<HomeProvider>(context, listen: false);
//     try {
//       await homeProvider
//           .getUsersBMR(
//             gender: homeProvider.userData['gender'],
//             weight: homeProvider.userData['weight'],
//             height: homeProvider.userData['height'],
//             age: homeProvider.userData['age'],
//             activity: homeProvider.userData['activity'],
//             goal: _valueGoals!,
//           )
//           .then((_) => settingsProvider.changeUsersGaols(
//               bmr: homeProvider.userBMRwithGoal,
//               goal: _valueGoals!,
//               context: context))
//           .then((_) => Navigator.of(context).pop());
//     } catch (e) {
//       print(e);
//     }
//   }
