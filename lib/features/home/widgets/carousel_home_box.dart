import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class CarouselHomeBox extends StatelessWidget {
  const CarouselHomeBox({
    super.key,
    required this.deviceWidth,
    required this.image,
    required this.onTap,
    required this.title,
  });

  final double deviceWidth;
  final String image;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingManager.p12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey3),
                color: ColorManager.grey3,
                borderRadius: BorderRadius.circular(RadiusManager.r15),
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.black,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: ColorManager.darkGrey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(-4, -4),
                  ),
                ],
              ),
              width: deviceWidth,
              height: SizeManager.s250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(RadiusManager.r15),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                color: ColorManager.white,
                fontSize: FontSize.s35,
                fontWeight: FontWightManager.bold,
                letterSpacing: SizeManager.s1,
              ),
            ),
          )
        ],
      ),
    );
  }
}