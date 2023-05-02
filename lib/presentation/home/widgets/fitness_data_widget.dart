import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/home/providers/home_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class FitnessDataWidget extends StatelessWidget {
  const FitnessDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    final deviceWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<Map<String, dynamic>>(
        future: homeProvider.fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitSpinningLines(color: ColorManager.limerGreen2);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            double bmr = homeProvider.userData['bmr'];
            double bmi = homeProvider.userData['bmi'];
            Color getProgressColor(double bmi) {
              var isNormalBMI = bmi >= 18.5 && bmi <= 25;
              var isUnderOrOverWeight =
                  (bmi >= 17 && bmi < 18.5) || (bmi > 25 && bmi <= 30);
              if (isNormalBMI) {
                return ColorManager.limerGreen2;
              } else if (isUnderOrOverWeight) {
                return ColorManager.yellow;
              } else {
                return ColorManager.red;
              }
            }

            String getMessage(double bmi) {
              var isNormalBMI = bmi >= 18.5 && bmi <= 25;
              var isUnderWeight = bmi >= 17 && bmi < 18.5;
              var isOverWeight = bmi > 25 && bmi <= 30;
              if (isNormalBMI) {
                return StringsManager.normalBmi;
              } else if (isUnderWeight) {
                return StringsManager.underWeightBmi;
              } else if (isOverWeight) {
                return StringsManager.overWeightBmi;
              } else {
                return StringsManager.dangerousBmi;
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                left: PaddingManager.p12.w,
                right: PaddingManager.p12.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: (deviceWidth / 3 - 16).w,
                    height: SizeManager.s212.h,
                    decoration: BoxDecoration(
                      color: ColorManager.black87,
                      borderRadius: BorderRadius.circular(RadiusManager.r15.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: PaddingManager.p12.h,
                            bottom: PaddingManager.p12.h,
                          ),
                          child: CircularPercentIndicator(
                            circularStrokeCap: CircularStrokeCap.round,
                            radius: RadiusManager.r40.r,
                            lineWidth: SizeManager.s8.w,
                            percent: bmi / 40,
                            progressColor: getProgressColor(bmi),
                            backgroundColor: ColorManager.grey3,
                            animateFromLastPercent: true,
                            center: Icon(
                              Icons.favorite_border,
                              color: getProgressColor(bmi),
                              size: SizeManager.s28,
                            ),
                          ),
                        ),
                        Text(
                          'BMI ${bmi.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                          style: StyleManager.homePageS20BoldWhite,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: PaddingManager.p12.h,
                            bottom: PaddingManager.p12.h,
                          ),
                          child: Text(
                            getMessage(bmi),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorManager.white2,
                              fontSize: FontSize.s12.sp,
                              fontWeight: FontWightManager.regular,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: PaddingManager.p12.w,
                          bottom: PaddingManager.p12.h,
                        ),
                        child: Container(
                          height: SizeManager.s100.h,
                          width: (deviceWidth * (2 / 3) - 20).w,
                          decoration: BoxDecoration(
                            color: ColorManager.limerGreen2,
                            borderRadius: BorderRadius.circular(
                              RadiusManager.r15.r,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                StringsManager.kcalConsumption,
                                style: StyleManager.homePageS18BoldDarkGrey,
                              ),
                              Text(
                                bmr.toStringAsFixed(0),
                                style: StyleManager.homePageS20BoldDarkGrey,
                              ),
                              Text(
                                StringsManager.kcalPerDay,
                                style: StyleManager.homePageS16RegularDarkGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: PaddingManager.p12.w,
                              right: PaddingManager.p12.w,
                            ),
                            child: Container(
                              width: (deviceWidth / 3 - 16).w,
                              height: SizeManager.s100.h,
                              decoration: BoxDecoration(
                                color: ColorManager.black87,
                                borderRadius:
                                    BorderRadius.circular(RadiusManager.r15.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: PaddingManager.p12.w,
                                      right: PaddingManager.p12.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          StringsManager.water,
                                          style:
                                              StyleManager.homePageS17BoldWhite,
                                        ),
                                        Icon(
                                          Icons.water_drop_outlined,
                                          size: SizeManager.s28,
                                          color: ColorManager.limerGreen2,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: PaddingManager.p12.w,
                                      right: PaddingManager.p12.w,
                                      top: PaddingManager.p12.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          consumptionProvider.waterADay
                                              .toStringAsFixed(1),
                                          style:
                                              StyleManager.homePageS20BoldWhite,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: PaddingManager.p12.w,
                                          ),
                                          child: Text(
                                            StringsManager.liters,
                                            style: StyleManager
                                                .homePageS12RegularWhite2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: (deviceWidth / 3 - 16).w,
                            height: SizeManager.s100.h,
                            decoration: BoxDecoration(
                              color: ColorManager.black87,
                              borderRadius:
                                  BorderRadius.circular(RadiusManager.r15.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: PaddingManager.p12.w,
                                    right: PaddingManager.p12.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringsManager.calories,
                                        style:
                                            StyleManager.homePageS17BoldWhite,
                                      ),
                                      Icon(
                                        Icons.local_pizza_outlined,
                                        size: SizeManager.s28,
                                        color: ColorManager.limerGreen2,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: PaddingManager.p12.w,
                                    right: PaddingManager.p12.w,
                                    top: PaddingManager.p12.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        consumptionProvider.kCalaDay
                                            .toStringAsFixed(0),
                                        style:
                                            StyleManager.homePageS20BoldWhite,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: PaddingManager.p12.w,
                                        ),
                                        child: Text(
                                          StringsManager.kcal,
                                          style: StyleManager
                                              .homePageS12RegularWhite2,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}
