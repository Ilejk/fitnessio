import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/new_meal_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
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

class _DrinkPageState extends State<DrinkPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _drinkController = TextEditingController();
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _drinkController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.darkGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: PaddingManager.p12),
          child: Container(
            height: SizeManager.s40,
            width: SizeManager.s40,
            decoration: BoxDecoration(
              color: ColorManager.grey3,
              borderRadius: BorderRadius.circular(
                RadiusManager.r40,
              ),
            ),
            child: IconButton(
              splashColor: ColorManager.grey3,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: SizeManager.s26,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: PaddingManager.p30,
                ),
                child: Text(
                  StringsManager.drinkPageText,
                  style: StyleManager.drinkPageTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: PaddingManager.p30,
                ),
                child: Lottie.asset(
                  AnimationManager.water,
                  controller: _animationController,
                  fit: BoxFit.cover,
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
                    consumptionProvider.addWater(
                      amount: double.parse(_drinkController.text),
                      dateTime: DateTime.now(),
                    );
                    _animationController.forward();
                    Future.delayed(
                      const Duration(
                        seconds: DurationManager.s2,
                      ),
                    ).then(
                      (value) => Navigator.of(context).pushReplacementNamed(
                        Routes.mainRoute,
                      ),
                    );
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
