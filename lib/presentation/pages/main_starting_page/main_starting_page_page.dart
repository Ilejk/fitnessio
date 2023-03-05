// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fitnessio/presentation/resources/managers/assets_manager.dart';
import 'package:fitnessio/presentation/resources/managers/color_manager.dart';
import 'package:fitnessio/presentation/resources/managers/routes_manager.dart';
import 'package:fitnessio/presentation/resources/managers/string_manager.dart';
import 'package:fitnessio/presentation/resources/managers/styles_manager.dart';
import 'package:fitnessio/presentation/resources/managers/values_manager.dart';
import '../../resources/widgets/main_green_button.dart';

class MainStartingPage extends StatefulWidget {
  const MainStartingPage({super.key});

  @override
  State<MainStartingPage> createState() => _MainStartingPageState();
}

class _MainStartingPageState extends State<MainStartingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageManager.backgroundMan),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Text(
                        AppStrings.fitnessio,
                        textAlign: TextAlign.center,
                        style: getBoldMainTitleTextStyle(
                          letterSpacing: AppLetterSpacing.l2_5,
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p18),
                      child: SizedBox(
                        width: AppSize.s250,
                        child: Text(
                          AppStrings.createUrWorkoutSubttitle,
                          textAlign: TextAlign.center,
                          style: getSemiBoldMainSubTitleTextStyle(
                            letterSpacing: AppLetterSpacing.l1_5,
                            color: ColorManager.darkPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s450,
                ),
                MainGreenButton(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.createAnAccountPage);
                  },
                  title: AppStrings.prodece,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
