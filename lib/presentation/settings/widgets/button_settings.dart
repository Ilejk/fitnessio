import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class SettingsPageButton extends StatelessWidget {
  const SettingsPageButton({
    Key? key,
    required this.deviceWidth,
    required this.onTap,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  final double deviceWidth;
  final VoidCallback onTap;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: PaddingManager.p12,
          left: PaddingManager.p12,
          right: PaddingManager.p12,
        ),
        child: Container(
          width: deviceWidth,
          height: SizeManager.s70,
          decoration: BoxDecoration(
            color: ColorManager.grey3,
            borderRadius: BorderRadius.circular(
              RadiusManager.r15,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: PaddingManager.p12),
                child: Text(
                  title,
                  style: StyleManager.settingsButtonTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: PaddingManager.p12),
                child: Icon(
                  iconData,
                  size: SizeManager.s24,
                  color: ColorManager.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
