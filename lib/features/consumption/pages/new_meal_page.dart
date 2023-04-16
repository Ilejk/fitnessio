import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/new_meal_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
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
  @override
  void dispose() {
    _mealTitleController.dispose();
    _mealCalloriesController.dispose();
    _mealAmountController.dispose();
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
                controller: _mealAmountController,
                labelHint: StringsManager.mealAmountHint,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              TextFieldWidget(
                controller: _mealCalloriesController,
                labelHint: StringsManager.mealCaloriesHint,
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
                    );
                    Navigator.of(context).pop();
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
