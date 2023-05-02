import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/new_meal_app_bar.dart';
import 'package:smart_home_app/presentation/workouts/providers/workout_provider.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/neu_dark_container_widget.dart';
import 'package:smart_home_app/utils/widgets/small_text_field_widget.dart';

class NewExercisePage extends StatefulWidget {
  const NewExercisePage({super.key});

  @override
  State<NewExercisePage> createState() => _NewExercisePageState();
}

class _NewExercisePageState extends State<NewExercisePage> {
  final TextEditingController _setNumberController = TextEditingController();
  final TextEditingController _repNumberController = TextEditingController();

  String? _valueExercise;

  @override
  void dispose() {
    _setNumberController.dispose();
    _repNumberController.dispose();

    super.dispose();
  }

  void _onChangedExercise(Object? selectedGenderValue) {
    if (selectedGenderValue is String) {
      setState(() {
        _valueExercise = selectedGenderValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          deviceWidth,
          SizeManager.s60.h,
        ),
        child: const NewMealPageAppBar(),
      ),
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: PaddingManager.p8),
                child: SizedBox(
                  width: SizeManager.s250.w,
                  height: SizeManager.s250.h,
                  child: Image.asset(
                    ImageManager.fork,
                  ),
                ),
              ),
              NeuButton(
                width: SizeManager.s400.w,
                height: SizeManager.s70.h,
                radius: RadiusManager.r15.r,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownDecoration: BoxDecoration(
                      color: ColorManager.darkGrey,
                      borderRadius: BorderRadius.circular(
                        RadiusManager.r15.r,
                      ),
                    ),
                    onChanged: _onChangedExercise,
                    value: _valueExercise,
                    iconSize: SizeManager.s0,
                    hint: Text(
                      StringsManager.exerciseHint,
                      style: StyleManager.registerTextfieldTextStyle,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: StringsManager.aroundTheWorldHint,
                        child: Text(
                          StringsManager.aroundTheWorldHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: StringsManager.abWheelHint,
                        child: Text(
                          StringsManager.abWheelHint,
                          style: StyleManager.registerTextfieldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextFieldWidget(
                    controller: _setNumberController,
                    labelHint: StringsManager.setNumberHint,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SmallTextFieldWidget(
                    controller: _repNumberController,
                    labelHint: StringsManager.repNumberHint,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  ),
                ],
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                  try {
                    workoutProvider.addNewWorkout(
                      name: _valueExercise!,
                      repNumber: int.parse(_repNumberController.text),
                      setNumber: int.parse(_setNumberController.text),
                      dateTime: DateTime.now(),
                    );
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.mainRoute);
                  } catch (e) {
                    print(e);
                  }
                },
                title: StringsManager.add,
              )
            ],
          ),
        ),
      ),
    );
  }
}
