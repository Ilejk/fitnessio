import 'package:flutter/material.dart';

import '../managers/color_manager.dart';
import '../managers/styles_manager.dart';
import '../managers/values_manager.dart';

// ignore: must_be_immutable
class MainGreenButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  MainGreenButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: AppSize.s60,
          width: AppSize.s275,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r35),
            color: ColorManager.primary,
            boxShadow: [
              BoxShadow(
                color: ColorManager.lighGreyWithOppacity,
                blurRadius: AppRadius.r12,
                offset: AppOffest.o5,
              ),
              BoxShadow(
                color: ColorManager.primaryWithOppacity,
                blurRadius: AppRadius.r12,
                offset: AppOffest.oN5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: getMainButtonTextStyle(
                color: ColorManager.white,
                letterSpacing: AppLetterSpacing.l2_0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
