import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/percent_value_of_meal.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
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
        left: PaddingManager.p1,
        right: PaddingManager.p1,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
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
          height: SizeManager.s200.h,
          decoration: BoxDecoration(
            color: ColorManager.black87,
            border: Border(
              bottom: BorderSide(
                color: ColorManager.limerGreen2,
                width: SizeManager.s1,
              ),
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
                        style: StyleManager.mealWidgetTitleTextStyle,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
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
                        style: StyleManager.mealWidgetDataTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: PaddingManager.p12,
                          right: PaddingManager.p12,
                        ),
                        child: Container(
                          width: SizeManager.s10.w,
                          height: SizeManager.s3.h,
                          decoration: BoxDecoration(
                            color: ColorManager.limerGreen2,
                            borderRadius: BorderRadius.circular(
                              RadiusManager.r100.r,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${amount.round()} G',
                        style: StyleManager.mealWidgetDataTextStyle,
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
