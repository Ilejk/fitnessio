import 'package:fitnessio/presentation/resources/managers/color_manager.dart';
import 'package:fitnessio/presentation/resources/managers/routes_manager.dart';
import 'package:fitnessio/presentation/resources/managers/string_manager.dart';
import 'package:fitnessio/presentation/resources/managers/styles_manager.dart';
import 'package:fitnessio/presentation/resources/managers/values_manager.dart';
import 'package:fitnessio/presentation/resources/widgets/main_green_button.dart';
import 'package:flutter/material.dart';

import '../../resources/managers/assets_manager.dart';

class CreateNewAccountPage extends StatefulWidget {
  const CreateNewAccountPage({super.key});

  @override
  State<CreateNewAccountPage> createState() => _CreateNewAccountPageState();
}

class _CreateNewAccountPageState extends State<CreateNewAccountPage> {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Container(
                  width: double.infinity,
                  height: AppSize.s500,
                  decoration: BoxDecoration(
                    color: ColorManager.blackWithOppacity,
                    borderRadius: BorderRadius.circular(
                      AppRadius.r35,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.gender,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.name,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.height,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.weight,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.arms,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.chest,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.waist,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.thigh,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p12),
                              child: Text(
                                AppStrings.calf,
                                style: getRegularTextStyle(
                                  color: ColorManager.white,
                                  letterSpacing: AppLetterSpacing.l1_5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s60,
              ),
              MainGreenButton(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.mainHomePage);
                },
                title: AppStrings.prodece,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
