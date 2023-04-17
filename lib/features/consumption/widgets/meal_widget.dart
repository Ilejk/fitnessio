import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.calories,
  });

  final String title;
  final double amount;
  final double calories;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p28,
        left: PaddingManager.p12,
        right: PaddingManager.p12,
        bottom: PaddingManager.p12,
      ),
      child: Container(
        width: deviceWidth,
        height: SizeManager.s100,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: FontSize.s22,
                  color: ColorManager.white,
                  fontWeight: FontWightManager.semiBold,
                  letterSpacing: SizeManager.s1,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$calories kCal',
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      color: ColorManager.limerGreen2,
                      fontWeight: FontWightManager.semiBold,
                      letterSpacing: SizeManager.s1,
                    ),
                  ),
                  Text(
                    '$amount gram',
                    style: const TextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.white2,
                      fontWeight: FontWightManager.regular,
                      letterSpacing: SizeManager.s1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
