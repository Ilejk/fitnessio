import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/home/providers/home_provider.dart';
import 'package:smart_home_app/presentation/profile/providers/profile_provider.dart';
import 'package:smart_home_app/presentation/settings/widgets/change_password_app_bar.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
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

  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _chestController.text = homeProvider.userData['chest'].toString();
    _shoulderController.text = homeProvider.userData['shoulders'].toString();
    _bicepsController.text = homeProvider.userData['biceps'].toString();
    _foreArmController.text = homeProvider.userData['foreArm'].toString();
    _waistController.text = homeProvider.userData['waist'].toString();
    _hipsController.text = homeProvider.userData['hips'].toString();
    _thighCotroller.text = homeProvider.userData['thigh'].toString();
    _calfController.text = homeProvider.userData['calf'].toString();
    _valueActivity = homeProvider.userData['activity'];
    _valueGoals = homeProvider.userData['goal'];
  }

  @override
  void dispose() {
    super.dispose();
    _chestController.dispose();
    _shoulderController.dispose();
    _bicepsController.dispose();
    _foreArmController.dispose();
    _waistController.dispose();
    _hipsController.dispose();
    _thighCotroller.dispose();
    _calfController.dispose();
  }

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

  Future<void> updateUsersMeasurements() async {
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    try {
      await homeProvider
          .getUsersBMR(
            gender: homeProvider.userData['gender'],
            weight: homeProvider.userData['weight'],
            height: homeProvider.userData['height'],
            age: homeProvider.userData['age'],
            activity: _valueActivity!,
            goal: _valueGoals!,
          )
          .then((_) => homeProvider.getUsersBMI(
                height: homeProvider.userData['height'],
                weight: homeProvider.userData['weight'],
              ))
          .then(
            (_) => profileProvider.updateUsersData(
              bmr: homeProvider.userBMRwithGoal,
              activity: _valueActivity!,
              context: context,
              goal: _valueGoals!,
              chest: double.parse(_chestController.text),
              shoulders: double.parse(_shoulderController.text),
              biceps: double.parse(_bicepsController.text),
              foreArm: double.parse(_foreArmController.text),
              waist: double.parse(_waistController.text),
              hips: double.parse(_hipsController.text),
              thigh: double.parse(_thighCotroller.text),
              calf: double.parse(_calfController.text),
            ),
          );
    } catch (e) {
      rethrow;
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
                  StringsManager.changeMeasurementsText,
                  textAlign: TextAlign.center,
                  style: StyleManager.settingsOptionTiteTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p28),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: PaddingManager.p12),
                      child: Row(
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
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: PaddingManager.p12),
                      child: Row(
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
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: PaddingManager.p12),
                      child: Row(
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
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: PaddingManager.p12),
                      child: Row(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: PaddingManager.p56),
                      child: Container(
                        width: SizeManager.s400.w,
                        height: SizeManager.s50.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.limerGreen2,
                              width: SizeManager.s0_7.h,
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            dropdownDecoration: BoxDecoration(
                              color: ColorManager.darkGrey,
                              borderRadius: BorderRadius.circular(
                                RadiusManager.r15.r,
                              ),
                            ),
                            onChanged: _onChangedActivity,
                            value: _valueActivity,
                            iconSize: SizeManager.s0,
                            hint: Text(
                              StringsManager.activityHint,
                              style: StyleManager.registerTextfieldTextStyle,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: StringsManager.activityLowHint,
                                child: Text(
                                  StringsManager.activityLowHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.activityLightHint,
                                child: Text(
                                  StringsManager.activityLightHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.activityModerateHint,
                                child: Text(
                                  StringsManager.activityModerateHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.activityHighHint,
                                child: Text(
                                  StringsManager.activityHighHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.activityVeryHighHint,
                                child: Text(
                                  StringsManager.activityVeryHighHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: PaddingManager.p28),
                      child: Container(
                        width: SizeManager.s400.w,
                        height: SizeManager.s50.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.limerGreen2,
                              width: SizeManager.s0_7.h,
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            dropdownDecoration: BoxDecoration(
                              color: ColorManager.darkGrey,
                              borderRadius: BorderRadius.circular(
                                RadiusManager.r15.r,
                              ),
                            ),
                            onChanged: _onChangedGoals,
                            value: _valueGoals,
                            iconSize: SizeManager.s0,
                            hint: Text(
                              StringsManager.goalHint,
                              style: StyleManager.registerTextfieldTextStyle,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: StringsManager.lose,
                                child: Text(
                                  StringsManager.loseWeightHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.maintain,
                                child: Text(
                                  StringsManager.maintainWeightHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                              DropdownMenuItem(
                                value: StringsManager.gain,
                                child: Text(
                                  StringsManager.gainWeightHint,
                                  style:
                                      StyleManager.registerTextfieldTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                  updateUsersMeasurements().then(
                    (value) => Navigator.of(context).pop(),
                  );
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
