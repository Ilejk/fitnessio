import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/new_meal_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/small_text_field_widget.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  final TextEditingController _drinkController = TextEditingController();

  @override
  void dispose() {
    _drinkController.dispose();
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
                padding: const EdgeInsets.only(
                  bottom: PaddingManager.p100,
                  top: PaddingManager.p30,
                ),
                child: CircularPercentIndicator(
                  radius: RadiusManager.r150,
                  animateFromLastPercent: true,
                  percent: 0.7,
                  backgroundColor: ColorManager.grey3,
                  progressColor: ColorManager.blue,
                  lineWidth: SizeManager.s20,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  center: Icon(
                    Icons.water_drop_outlined,
                    size: SizeManager.s65,
                    color: ColorManager.limerGreen2,
                  ),
                ),
              ),
              TextFieldWidget(
                controller: _drinkController,
                labelHint: StringsManager.waterHint,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                  try {
                    //TODO
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
