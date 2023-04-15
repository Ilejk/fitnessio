import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class TodaysActivitySpacerWidget extends StatelessWidget {
  const TodaysActivitySpacerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: PaddingManager.p12,
        bottom: PaddingManager.p28,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          StringsManager.todaysAct,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ColorManager.white,
            fontWeight: FontWightManager.semiBold,
            fontSize: FontSize.s25,
            letterSpacing: SizeManager.s1,
          ),
        ),
      ),
    );
  }
}
