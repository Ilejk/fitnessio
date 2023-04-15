import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/home/providers/home_provider.dart';
import 'package:smart_home_app/features/home/widgets/todays_progress_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TodaysProgressWidget(deviceWidth: deviceWidth),
            Padding(
              padding: const EdgeInsets.only(
                left: PaddingManager.p12,
                right: PaddingManager.p12,
                bottom: PaddingManager.p28,
              ),
              child: Container(
                width: deviceWidth,
                height: SizeManager.s250,
                decoration: BoxDecoration(
                  color: ColorManager.grey3,
                  borderRadius: BorderRadius.circular(
                    RadiusManager.r40,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: deviceWidth / 5,
                      height: SizeManager.s250,
                      decoration: BoxDecoration(
                        color: ColorManager.limerGreen2,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(RadiusManager.r40),
                          bottomLeft: Radius.circular(RadiusManager.r40),
                          topRight: Radius.circular(RadiusManager.r15),
                          bottomRight: Radius.circular(RadiusManager.r15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingManager.p12,
                          top: PaddingManager.p12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(PaddingManager.p12),
                              child: Icon(
                                Icons.sports_gymnastics_sharp,
                                size: SizeManager.s40,
                                color: ColorManager.darkGrey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: PaddingManager.p12,
                                bottom: PaddingManager.p12,
                              ),
                              child: Text(
                                '1,345',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorManager.darkGrey,
                                  fontSize: FontSize.s20,
                                  fontWeight: FontWightManager.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: PaddingManager.p12,
                                bottom: PaddingManager.p12,
                              ),
                              child: Text(
                                'Calories',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorManager.darkGrey,
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWightManager.regular,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
