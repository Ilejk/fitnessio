import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/new_meal_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({super.key});

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  final TextEditingController _mealTitleController = TextEditingController();
  final TextEditingController _mealCalloriesController =
      TextEditingController();
  final TextEditingController _mealAmountController = TextEditingController();
  final TextEditingController _mealFatsController = TextEditingController();
  final TextEditingController _mealCarbsController = TextEditingController();
  final TextEditingController _mealProteinsController = TextEditingController();

  @override
  void dispose() {
    _mealTitleController.dispose();
    _mealCalloriesController.dispose();
    _mealAmountController.dispose();
    _mealCarbsController.dispose();
    _mealFatsController.dispose();
    _mealProteinsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          deviceWidth,
          SizeManager.s60,
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
                  width: SizeManager.s250,
                  height: SizeManager.s250,
                  child: Image.asset(
                    ImageManager.fork,
                  ),
                ),
              ),
              TextFieldWidget(
                controller: _mealTitleController,
                labelHint: StringsManager.mealNameHint,
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              TextFieldWidget(
                controller: _mealCalloriesController,
                labelHint: StringsManager.mealCaloriesHint,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _mealAmountController,
                labelHint: StringsManager.mealAmountHint,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              TextFieldWidget(
                controller: _mealFatsController,
                labelHint: StringsManager.mealFatsHint,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _mealCarbsController,
                labelHint: StringsManager.mealCarbsHint,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _mealProteinsController,
                labelHint: StringsManager.mealProteinsHint,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                  try {
                    consumptionProvider.addNewMeal(
                      title: _mealTitleController.text,
                      amount: double.parse(_mealAmountController.text),
                      calories: double.parse(_mealCalloriesController.text),
                      fats: double.parse(_mealFatsController.text),
                      carbs: double.parse(_mealCarbsController.text),
                      proteins: double.parse(_mealProteinsController.text),
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
