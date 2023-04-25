import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/percent_value_of_meal.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.calories,
    required this.carbs,
    required this.fats,
    required this.proteins,
    required this.onPressed,
    required this.id,
  });

  final String title;
  final double amount;
  final double calories;
  final double fats;
  final double carbs;
  final double proteins;
  final Function(BuildContext)? onPressed;
  final String id;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p8,
        left: PaddingManager.p12,
        right: PaddingManager.p12,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(RadiusManager.r40),
              onPressed: onPressed,
              icon: Icons.delete,
              label: StringsManager.delete,
              foregroundColor: ColorManager.limerGreen2,
              backgroundColor: ColorManager.darkGrey,
            ),
          ],
        ),
        child: Container(
          width: deviceWidth,
          height: SizeManager.s200,
          decoration: BoxDecoration(
            color: ColorManager.black87,
            borderRadius: BorderRadius.circular(
              RadiusManager.r40,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: PaddingManager.p12,
              right: PaddingManager.p12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: PaddingManager.p28,
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                    right: PaddingManager.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingManager.p12,
                        ),
                        child: Icon(
                          Icons.done_all_rounded,
                          color: ColorManager.limerGreen2,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: FontSize.s22,
                          color: ColorManager.white,
                          fontWeight: FontWightManager.semiBold,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '🔥${calories.round()} kcal',
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.white2,
                          fontWeight: FontWightManager.regular,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: PaddingManager.p12,
                          right: PaddingManager.p12,
                        ),
                        child: Container(
                          width: SizeManager.s10,
                          height: SizeManager.s3,
                          decoration: BoxDecoration(
                            color: ColorManager.limerGreen2,
                            borderRadius: BorderRadius.circular(
                              RadiusManager.r100,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${amount.round()} G',
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.white2,
                          fontWeight: FontWightManager.regular,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PercentValueOfMeal(
                      value: fats,
                      amount: amount,
                      title: StringsManager.fats,
                    ),
                    PercentValueOfMeal(
                      value: carbs,
                      amount: amount,
                      title: StringsManager.carbs,
                    ),
                    PercentValueOfMeal(
                      value: proteins,
                      amount: amount,
                      title: StringsManager.proteins,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
