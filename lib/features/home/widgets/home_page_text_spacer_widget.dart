import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class HomePageTextSpacerWidget extends StatelessWidget {
  const HomePageTextSpacerWidget({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: PaddingManager.p12,
        bottom: PaddingManager.p12,
        top: PaddingManager.p12,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: StyleManager.homePageTextSpacerTextStyle,
        ),
      ),
    );
  }
}
