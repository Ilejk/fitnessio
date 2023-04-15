import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class BottomDataWidget extends StatelessWidget {
  const BottomDataWidget({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: PaddingManager.p12,
        right: PaddingManager.p12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: deviceWidth / 3 - 16,
            height: SizeManager.s212,
            decoration: BoxDecoration(
              color: ColorManager.black87,
              borderRadius: BorderRadius.circular(RadiusManager.r15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: PaddingManager.p12,
                    bottom: PaddingManager.p12,
                  ),
                  child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    radius: RadiusManager.r40,
                    lineWidth: SizeManager.s8,
                    percent: 0.8,
                    progressColor: ColorManager.limerGreen2,
                    backgroundColor: ColorManager.grey3,
                    animateFromLastPercent: true,
                    center: Icon(
                      Icons.directions_walk_sharp,
                      color: ColorManager.limerGreen2,
                      size: SizeManager.s28,
                    ),
                  ),
                ),
                const Text(
                  '8000',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s20,
                    fontWeight: FontWightManager.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: PaddingManager.p12,
                    bottom: PaddingManager.p12,
                  ),
                  child: Text(
                    'Out of 10,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.white2,
                      fontSize: FontSize.s12,
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
                padding: const EdgeInsets.only(
                  left: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                ),
                child: Container(
                  height: SizeManager.s100,
                  width: deviceWidth * (2 / 3) - 20,
                  decoration: BoxDecoration(
                    color: ColorManager.limerGreen2,
                    borderRadius: BorderRadius.circular(
                      RadiusManager.r15,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Calorie Consumption',
                        style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: FontSize.s18,
                          fontWeight: FontWightManager.bold,
                        ),
                      ),
                      Text(
                        '3000',
                        style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: FontSize.s35,
                          fontWeight: FontWightManager.bold,
                        ),
                      ),
                      Text(
                        'Calories/Day',
                        style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: FontSize.s16,
                          fontWeight: FontWightManager.regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PaddingManager.p12, right: PaddingManager.p12),
                    child: Container(
                      width: deviceWidth / 3 - 16,
                      height: SizeManager.s100,
                      decoration: BoxDecoration(
                        color: ColorManager.black87,
                        borderRadius: BorderRadius.circular(RadiusManager.r15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: PaddingManager.p12,
                              right: PaddingManager.p12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Water',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWightManager.bold,
                                  ),
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
                            padding: const EdgeInsets.only(
                              left: PaddingManager.p12,
                              right: PaddingManager.p12,
                              top: PaddingManager.p12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  '2.1',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s20,
                                    fontWeight: FontWightManager.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: PaddingManager.p12),
                                  child: Text(
                                    'Liters',
                                    style: TextStyle(
                                      color: ColorManager.white2,
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWightManager.regular,
                                    ),
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
                    width: deviceWidth / 3 - 16,
                    height: SizeManager.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.black87,
                      borderRadius: BorderRadius.circular(RadiusManager.r15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: PaddingManager.p12,
                            right: PaddingManager.p12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Calories',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s18,
                                  fontWeight: FontWightManager.bold,
                                ),
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
                          padding: const EdgeInsets.only(
                            left: PaddingManager.p12,
                            right: PaddingManager.p12,
                            top: PaddingManager.p12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                '1350',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s20,
                                  fontWeight: FontWightManager.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: PaddingManager.p12),
                                child: Text(
                                  'kCal',
                                  style: TextStyle(
                                    color: ColorManager.white2,
                                    fontSize: FontSize.s12,
                                    fontWeight: FontWightManager.regular,
                                  ),
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
}
