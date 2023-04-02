import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/managers/color_manager.dart';
import 'package:smart_home_app/resources/managers/font_manager.dart';
import 'package:smart_home_app/resources/managers/string_manager.dart';
import 'package:smart_home_app/resources/managers/value_manager.dart';

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
              onPressed: () {
                //TODO GO TO ACCOUNT PAGE
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
        StringsManager.smartHome,
        style: TextStyle(
          fontSize: FontSize.s25,
          fontWeight: FontWeight.bold,
          letterSpacing: SizeManager.s5,
          color: ColorManager.white,
        ),
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
              onPressed: () {
                //TODO GO TO NOTIFICATION PAGE
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
    );
  }
}
