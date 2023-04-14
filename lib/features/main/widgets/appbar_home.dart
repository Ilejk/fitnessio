import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class HomePageAppBarWidget extends StatelessWidget {
  const HomePageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: SizeManager.s50,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: PaddingManager.p12),
        child: Container(
          height: SizeManager.s40,
          width: SizeManager.s40,
          decoration: BoxDecoration(
            color: ColorManager.grey3,
            borderRadius: BorderRadius.circular(
              RadiusManager.r40,
            ),
          ),
          child: IconButton(
              splashColor: ColorManager.grey3,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.accountRoute);
              },
              icon: const Icon(
                Icons.person_outline_sharp,
                size: SizeManager.s26,
                color: ColorManager.white,
              )),
        ),
      ),
      elevation: SizeManager.s0,
      title: const Text(
        StringsManager.fitnessioABtitle,
        style: StyleManager.appbarTitleTextStyle,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: PaddingManager.p12),
          child: Container(
            height: SizeManager.s40,
            width: SizeManager.s40,
            decoration: BoxDecoration(
              color: ColorManager.grey3,
              borderRadius: BorderRadius.circular(
                RadiusManager.r40,
              ),
            ),
            child: IconButton(
              splashColor: ColorManager.grey3,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.notificationsRoute);
              },
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: SizeManager.s26,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
