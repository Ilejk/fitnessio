import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class TodaysActivityDataWidget extends StatelessWidget {
  const TodaysActivityDataWidget({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    final greenBoxWidth = deviceWidth / 5;
    return Padding(
      padding: const EdgeInsets.only(
        left: PaddingManager.p12,
        right: PaddingManager.p12,
        bottom: PaddingManager.p28,
      ),
      child: Container(
        width: deviceWidth,
        height: SizeManager.s250,
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(
            RadiusManager.r40,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: greenBoxWidth,
              height: SizeManager.s250,
              decoration: BoxDecoration(
                color: ColorManager.limerGreen2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(RadiusManager.r40),
                  bottomLeft: Radius.circular(RadiusManager.r40),
                  topRight: Radius.circular(RadiusManager.r15),
                  bottomRight: Radius.circular(RadiusManager.r15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: PaddingManager.p12,
                  top: PaddingManager.p12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(PaddingManager.p12),
                      child: Icon(
                        Icons.sports_gymnastics_sharp,
                        size: SizeManager.s40,
                        color: ColorManager.darkGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: PaddingManager.p12,
                        bottom: PaddingManager.p12,
                      ),
                      child: Text(
                        '1,345',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: FontSize.s20,
                          fontWeight: FontWightManager.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: PaddingManager.p12,
                        bottom: PaddingManager.p12,
                      ),
                      child: Text(
                        'Calories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: FontSize.s12,
                          fontWeight: FontWightManager.regular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: PaddingManager.p12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: SizeManager.s70,
                    width: deviceWidth - greenBoxWidth - 36,
                    decoration: BoxDecoration(
                      color: ColorManager.grey3,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(RadiusManager.r15),
                        bottomLeft: Radius.circular(RadiusManager.r15),
                        topRight: Radius.circular(RadiusManager.r40),
                        bottomRight: Radius.circular(RadiusManager.r15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: PaddingManager.p12,
                        right: PaddingManager.p12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: PaddingManager.p12),
                            child: Container(
                              height: SizeManager.s24,
                              width: SizeManager.s5,
                              decoration: BoxDecoration(
                                color: ColorManager.limerGreen2,
                                borderRadius: BorderRadius.circular(
                                  RadiusManager.r40,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Lunges',
                            style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWightManager.semiBold,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const Text(
                            '10x5',
                            style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWightManager.regular,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingManager.p12),
                    child: Container(
                      height: SizeManager.s70,
                      width: deviceWidth - greenBoxWidth - 36,
                      decoration: BoxDecoration(
                        color: ColorManager.grey3,
                        borderRadius: BorderRadius.circular(RadiusManager.r15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: PaddingManager.p12,
                          right: PaddingManager.p12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: PaddingManager.p12),
                              child: Container(
                                height: SizeManager.s24,
                                width: SizeManager.s5,
                                decoration: BoxDecoration(
                                  color: ColorManager.limerGreen2,
                                  borderRadius: BorderRadius.circular(
                                    RadiusManager.r40,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Push-ups',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWightManager.semiBold,
                                fontSize: FontSize.s20,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Text(
                              '15x3',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWightManager.regular,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingManager.p12),
                    child: Container(
                      height: SizeManager.s70,
                      width: deviceWidth - greenBoxWidth - 36,
                      decoration: BoxDecoration(
                        color: ColorManager.grey3,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(RadiusManager.r15),
                          bottomLeft: Radius.circular(RadiusManager.r15),
                          topRight: Radius.circular(RadiusManager.r15),
                          bottomRight: Radius.circular(RadiusManager.r40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: PaddingManager.p12,
                          right: PaddingManager.p12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: PaddingManager.p12),
                              child: Container(
                                height: SizeManager.s24,
                                width: SizeManager.s5,
                                decoration: BoxDecoration(
                                  color: ColorManager.limerGreen2,
                                  borderRadius: BorderRadius.circular(
                                    RadiusManager.r40,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Squads',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWightManager.semiBold,
                                fontSize: FontSize.s20,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Text(
                              '35x4',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWightManager.regular,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
