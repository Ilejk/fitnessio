import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/quick_water_add_button.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_underlined.dart';

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
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    addCustomWater() {
      try {
        consumptionProvider.addWater(
          amount: double.parse(_drinkController.text),
          dateTime: DateTime.now(),
        );
        Navigator.of(context).pop();
      } catch (e) {
        rethrow;
      }
    }

    addFixedWater({required double amount}) {
      try {
        consumptionProvider.addWater(
          amount: amount,
          dateTime: DateTime.now(),
        );
        Navigator.of(context).pop();
      } catch (e) {
        rethrow;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.drinkPageHeadLine,
          style: StyleManager.abTitleTextStyle,
        ),
        elevation: 0.0,
        backgroundColor: ColorManager.darkGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: PaddingManager.p12),
          child: Container(
            height: SizeManager.s40.h,
            width: SizeManager.s40.w,
            decoration: BoxDecoration(
              color: ColorManager.grey3,
              borderRadius: BorderRadius.circular(
                RadiusManager.r40.r,
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
              Center(
                child: SizedBox(
                  height: SizeManager.s300.h,
                  child: Lottie.asset(
                    AnimationManager.water,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                  ),
                  child: Text(
                    StringsManager.quickAdd,
                    style: StyleManager.drinkPageSpacerTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p12,
                  right: PaddingManager.p12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    QuickWaterAddButton(
                      label: StringsManager.l02,
                      addWater: () {
                        addFixedWater(amount: 0.2);
                      },
                    ),
                    QuickWaterAddButton(
                      label: StringsManager.l05,
                      addWater: () {
                        addFixedWater(amount: 0.5);
                      },
                    ),
                    QuickWaterAddButton(
                      label: StringsManager.l1,
                      addWater: () {
                        addFixedWater(amount: 1.0);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                    top: PaddingManager.p28,
                  ),
                  child: Text(
                    StringsManager.customAdd,
                    style: StyleManager.drinkPageSpacerTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  top: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _drinkController,
                  labelHint: StringsManager.waterHint,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: addCustomWater,
                title: StringsManager.add,
              )
            ],
          ),
        ),
      ),
    );
  }
}
