import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/route_manager.dart';
import 'package:smart_home_app/resources/string_manager.dart';
import 'package:smart_home_app/resources/value_manager.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p28,
        right: PaddingManager.p28,
        left: PaddingManager.p28,
      ),
      child: Container(
        height: SizeManager.s70,
        width: SizeManager.s400,
        decoration: BoxDecoration(
          color: ColorManager.black87,
          borderRadius: BorderRadius.circular(
            RadiusManager.r40,
          ),
          boxShadow: const [
            BoxShadow(
              color: ColorManager.black87,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: ColorManager.black,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Dismissible(
          key: const Key(StringsManager.key),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(PaddingManager.p3),
            child: Container(
              height: SizeManager.s65,
              width: SizeManager.s65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r40),
                color: ColorManager.limeGreen,
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
              child: const Icon(
                Icons.double_arrow_rounded,
                color: ColorManager.black87,
                size: SizeManager.s40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
