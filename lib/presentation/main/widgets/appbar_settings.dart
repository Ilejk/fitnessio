import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/auth/providers/auth_provider.dart';
import 'package:smart_home_app/presentation/settings/providers/settings_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class SettingsPageAppBarWidget extends StatefulWidget {
  const SettingsPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPageAppBarWidget> createState() =>
      _SettingsPageAppBarWidgetState();
}

class _SettingsPageAppBarWidgetState extends State<SettingsPageAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    Future<void> signOut(
        SettingsProvider settingsProvider, BuildContext context) async {
      await settingsProvider.signOut(context: context);
      authProvider.callAuth();
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: SizeManager.s50,
      automaticallyImplyLeading: false,
      elevation: SizeManager.s0,
      title: const Text(
        StringsManager.settingsABtitle,
        style: StyleManager.appbarTitleTextStyle,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: PaddingManager.p12),
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
              onPressed: () => signOut(settingsProvider, context),
              icon: const Icon(
                Icons.logout_sharp,
                size: SizeManager.s26,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
