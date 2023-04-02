import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/managers/color_manager.dart';
import 'package:smart_home_app/resources/managers/value_manager.dart';

class NeuButton extends StatelessWidget {
  const NeuButton({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: PaddingManager.p28,
        left: PaddingManager.p28,
        bottom: PaddingManager.p20,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(
            radius,
          ),
          boxShadow: [
            const BoxShadow(
              color: ColorManager.black,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: ColorManager.grey2,
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
