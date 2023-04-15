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
      elevation: SizeManager.s0,
      title: const Text(
        StringsManager.fitnessioABtitle,
        style: StyleManager.appbarTitleTextStyle,
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
