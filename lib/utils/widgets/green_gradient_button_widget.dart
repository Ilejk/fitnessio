import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class LimeGreenRoundedButtonWidget extends StatelessWidget {
  const LimeGreenRoundedButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: PaddingManager.p28,
          right: PaddingManager.p28,
          left: PaddingManager.p28,
        ),
        child: Container(
          height: SizeManager.s70,
          width: SizeManager.s400,
          decoration: BoxDecoration(
            color: ColorManager.limeGreen,
            borderRadius: BorderRadius.circular(
              RadiusManager.r40,
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorManager.darkGrey,
                fontSize: FontSize.s30,
                fontWeight: FontWightManager.bold,
                letterSpacing: SizeManager.s1_5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
