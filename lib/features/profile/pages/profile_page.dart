import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/settings/widgets/button_settings.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                  top: PaddingManager.p12,
                ),
                child: Text(
                  StringsManager.personalInfo,
                  style: StyleManager.settingsPageSpacerTextStyle,
                ),
              ),
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeWeightRoute),
              iconData: Icons.line_weight,
              title: StringsManager.weight,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeHeightRoute),
              iconData: Icons.height,
              title: StringsManager.height,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeActivityRoute),
              iconData: Icons.local_activity_outlined,
              title: StringsManager.activity,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeGoalsRoute),
              iconData: Icons.grade_outlined,
              title: StringsManager.goal,
            ),
          ],
        ).animate().fadeIn(
              duration: 500.ms,
            ),
      ),
    );
  }
}
