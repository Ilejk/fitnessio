import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class TodaysProgressWidget extends StatelessWidget {
  const TodaysProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p28,
        left: PaddingManager.p12,
        right: PaddingManager.p12,
      ),
      child: Container(
        width: deviceWidth,
        decoration: BoxDecoration(
          color: ColorManager.black87,
          borderRadius: BorderRadius.circular(
            RadiusManager.r40,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: PaddingManager.p12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      top: PaddingManager.p12,
                      right: PaddingManager.p20,
                      left: PaddingManager.p20,
                    ),
                    child: Text(
                      StringsManager.todaysProg,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontWeight: FontWightManager.bold,
                        fontSize: FontSize.s22,
                        letterSpacing: SizeManager.s1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: PaddingManager.p12,
                      right: PaddingManager.p20,
                      left: PaddingManager.p20,
                    ),
                    child: Text(
                      '12 Exercises Left',
                      style: TextStyle(
                        color: ColorManager.white2,
                        fontWeight: FontWightManager.regular,
                        fontSize: FontSize.s14,
                        letterSpacing: SizeManager.s1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: PaddingManager.p12,
                  right: PaddingManager.p20,
                  left: PaddingManager.p20,
                ),
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: RadiusManager.r40,
                  lineWidth: SizeManager.s8,
                  percent: 0.7,
                  progressColor: ColorManager.limerGreen2,
                  backgroundColor: ColorManager.grey3,
                  animateFromLastPercent: true,
                  center: const Text(
                    '70%',
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s18,
                      fontWeight: FontWightManager.semiBold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
