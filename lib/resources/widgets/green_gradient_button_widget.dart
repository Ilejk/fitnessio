import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/managers/color_manager.dart';
import 'package:smart_home_app/resources/managers/font_manager.dart';
import 'package:smart_home_app/resources/managers/value_manager.dart';

class GreenGradientButtonWidget extends StatelessWidget {
  const GreenGradientButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 163, 204, 93),
                Color.fromARGB(255, 64, 82, 28),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 6, 7, 3),
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 163, 204, 93),
                blurRadius: 8,
                offset: Offset(-4, -4),
              ),
            ],
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
