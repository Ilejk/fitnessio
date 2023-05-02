import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/home/providers/home_provider.dart';
import 'package:smart_home_app/presentation/settings/widgets/button_settings.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
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
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

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
                          style: TextStyle(
                            color: ColorManager.limerGreen2,
                            fontSize: FontSize.s18.sp,
                            fontWeight: FontWightManager.bold,
                            letterSpacing: SizeManager.s1,
                          ),
                        ),
                        Text(
                          homeProvider.userData['email'],
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16.sp,
                            fontWeight: FontWightManager.regular,
                            letterSpacing: SizeManager.s1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingManager.p12,
                right: PaddingManager.p12,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(Routes.changeMeasurementsRoute),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.edit,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16.sp,
                          fontWeight: FontWightManager.regular,
                          letterSpacing: SizeManager.s1,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(
                        width: SizeManager.s3.w,
                      ),
                      const Icon(
                        Icons.edit,
                        color: ColorManager.white,
                        size: SizeManager.s18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeManager.s600.h,
              child: Image.asset(
                homeProvider.userData['gender'] == 'MAN'
                    ? ImageManager.man
                    : ImageManager.woman,
              ),
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeWeightRoute),
              iconData: Icons.line_weight,
              title: StringsManager.weight,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeHeightRoute),
              iconData: Icons.height,
              title: StringsManager.height,
            ),
          ],
        ).animate().fadeIn(
              duration: 500.ms,
            ),
      ),
    );
  }
}
