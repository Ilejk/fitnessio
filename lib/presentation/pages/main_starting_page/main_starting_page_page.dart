import 'package:fitnessio/presentation/resources/assets_manager.dart';
import 'package:fitnessio/presentation/resources/color_manager.dart';
import 'package:fitnessio/presentation/resources/string_manager.dart';
import 'package:fitnessio/presentation/resources/styles_manager.dart';
import 'package:fitnessio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

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
                  height: AppSize.s150,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: InkWell(
                    onTap: () {
                      //GO TO CREATE AN ACCOUNT IF THE FIRST TIME OR TO MAIN HOME PAGE IF NOT
                    },
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
                          AppStrings.prodece,
                          textAlign: TextAlign.center,
                          style: getMainButtonTextStyle(
                            color: ColorManager.white,
                            letterSpacing: AppLetterSpacing.l2_0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
