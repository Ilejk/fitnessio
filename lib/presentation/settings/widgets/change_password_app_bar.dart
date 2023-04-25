import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class ChangeDataPagesAppBar extends StatelessWidget {
  const ChangeDataPagesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.darkGrey,
      elevation: SizeManager.s0,
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
            splashColor: ColorManager.grey3,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: SizeManager.s26,
              color: ColorManager.white,
            ),
          ),
        ),
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
