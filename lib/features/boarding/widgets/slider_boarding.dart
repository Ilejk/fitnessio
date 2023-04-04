import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smart_home_app/resources/managers/color_manager.dart';
import 'package:smart_home_app/resources/router/router.dart';
import 'package:smart_home_app/resources/managers/string_manager.dart';
import 'package:smart_home_app/resources/managers/value_manager.dart';

class SliderBoardingWidget extends StatelessWidget {
  const SliderBoardingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.p28),
      child: SlideAction(
        outerColor: ColorManager.black87,
        innerColor: ColorManager.limeGreen,
        sliderButtonIcon: const Icon(Icons.double_arrow_sharp),
        text: StringsManager.swipeToPrc,
        onSubmit: () {
          Navigator.of(context).pushReplacementNamed(Routes.authRoute);
        },
      ),
    );
  }
}
