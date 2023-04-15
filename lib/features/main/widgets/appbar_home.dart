import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/home/providers/home_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class HomePageAppBarWidget extends StatelessWidget {
  const HomePageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return FutureBuilder<Map<String, dynamic>>(
        future: homeProvider.fetchUserData(),
        builder: (context, snapshot) {
          return AppBar(
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
                    onPressed: () {
                      //TODO:::
                    },
                    icon: const Icon(
                      Icons.notifications_none_sharp,
                      size: SizeManager.s26,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: false,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: SizeManager.s50,
            automaticallyImplyLeading: false,
            elevation: SizeManager.s0,
            title: Padding(
              padding: const EdgeInsets.all(PaddingManager.p12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringsManager.welcomeBack,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s16,
                      letterSpacing: SizeManager.s0_7,
                    ),
                  ),
                  Text(
                    '${homeProvider.userData['first name']} ${homeProvider.userData['surname']} !',
                    style: const TextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s18,
                      letterSpacing: SizeManager.s0_7,
                    ),
                  )
                ],
              ),
            ),
          ).animate().fadeIn(
                duration: 500.ms,
              );
        });
  }
}
