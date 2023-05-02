import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
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
            RadiusManager.r40.r,
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingManager.p12,
                      right: PaddingManager.p20,
                      left: PaddingManager.p20,
                    ),
                    child: Text(
                      StringsManager.todaysProg,
                      style: StyleManager.homePageTodaysProgressTextSTyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingManager.p12,
                      right: PaddingManager.p20,
                      left: PaddingManager.p20,
                    ),
                    child: Text(
                      '12 Exercises Left',
                      style: StyleManager.homePageS14RegularWhite2L1,
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
                  radius: RadiusManager.r40.r,
                  lineWidth: SizeManager.s8.w,
                  percent: 0.7,
                  progressColor: ColorManager.limerGreen2,
                  backgroundColor: ColorManager.grey3,
                  animateFromLastPercent: true,
                  center: Text(
                    '70%',
                    style: StyleManager.homePagePogressBarTextStyle,
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
