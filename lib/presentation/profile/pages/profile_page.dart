import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/home/providers/home_provider.dart';
import 'package:smart_home_app/presentation/profile/providers/profile_provider.dart';
import 'package:smart_home_app/presentation/profile/widgets/edit_text_button.dart';
import 'package:smart_home_app/presentation/profile/widgets/weight_data_text_row.dart';
import 'package:smart_home_app/presentation/profile/widgets/weight_line_chart.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) => FutureBuilder<
              Map<String, dynamic>>(
          future: homeProvider.fetchUserData(),
          builder: (context, snapshot) {
            final String emailData = homeProvider.userData['email'];
            final double chestData = homeProvider.userData['chest'];
            final double shoulderData = homeProvider.userData['shoulders'];
            final double bicepsData = homeProvider.userData['biceps'];
            final double foreArmData = homeProvider.userData['foreArm'];
            final double waistData = homeProvider.userData['waist'];
            final double hipsData = homeProvider.userData['hips'];
            final double thighData = homeProvider.userData['thigh'];
            final double calfData = homeProvider.userData['calf'];
            profileProvider.fetchAndSetFlSpots();
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: PaddingManager.p12,
                        right: PaddingManager.p12,
                        top: PaddingManager.p4,
                      ),
                      child: Container(
                        width: deviceWidth,
                        height: SizeManager.s60.h,
                        decoration: BoxDecoration(
                          color: ColorManager.black87,
                          borderRadius: BorderRadius.circular(
                            RadiusManager.r40.r,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: PaddingManager.p28,
                              right: PaddingManager.p28,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  StringsManager.loggedInAs,
                                  style: StyleManager.profieloggedinTextStyle,
                                ),
                                Text(
                                  emailData,
                                  style: StyleManager.profileLoginDataTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    EditTextButton(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.changeMeasurementsRoute),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: SizeManager.s600.h,
                          width: deviceWidth,
                          child: Image.asset(
                            homeProvider.userData['gender'] == 'MAN'
                                ? ImageManager.man
                                : ImageManager.woman,
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s140.h,
                          left: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.chest,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${chestData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s150.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s100.h,
                          right: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.shoulders,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${shoulderData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s130.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s160.h,
                          right: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.biceps,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${bicepsData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s110.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s212.h,
                          left: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.foreArm,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${foreArmData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s100.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s230.h,
                          right: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.waist,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${waistData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s140.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s270.h,
                          left: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.hips,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${hipsData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s140.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: SizeManager.s330.h,
                          left: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.thigh,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${thighData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s150.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: SizeManager.s140.h,
                          right: SizeManager.s35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    StringsManager.calf,
                                    style: StyleManager
                                        .profileBodyMeasurmentsNameTextSTyle,
                                  ),
                                  Text(
                                    '${calfData.toStringAsFixed(1)} cm',
                                    style: StyleManager
                                        .profileBodyMeasurementsDataTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                height: SizeManager.s2.h,
                                width: SizeManager.s140.w,
                                color: ColorManager.black87,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    EditTextButton(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.changeWeightRoute),
                    ),
                    const WeightDataTextRowWidget(),
                    const WeightLineChart(),
                  ],
                ).animate().fadeIn(
                      duration: 500.ms,
                    ),
              ),
            );
          }),
    );
  }
}
