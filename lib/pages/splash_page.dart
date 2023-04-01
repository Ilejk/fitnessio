import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/main.dart';
import 'package:smart_home_app/resources/asset_manager.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/route_manager.dart';
import 'package:smart_home_app/resources/string_manager.dart';
import 'package:smart_home_app/resources/style_manager.dart';
import 'package:smart_home_app/resources/value_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CarouselController _controller = CarouselController();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<String> imgList = [
    ImageManager.splashBG1,
    ImageManager.splashBG2,
    ImageManager.splashBG3,
    ImageManager.splashBG4,
    ImageManager.splashBG5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: imgList
                .map((item) => Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ))
                .toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeManager.s400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.black87,
                borderRadius: BorderRadius.circular(
                  RadiusManager.r15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingManager.p28),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: imgList.length,
                      effect: CustomizableEffect(
                        spacing: SizeManager.s16,
                        dotDecoration: DotDecoration(
                          width: SizeManager.s8,
                          height: SizeManager.s8,
                          color: ColorManager.white,
                          borderRadius:
                              BorderRadius.circular(RadiusManager.r24),
                          dotBorder: const DotBorder(
                            width: SizeManager.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                        activeDotDecoration: DotDecoration(
                          width: SizeManager.s20,
                          height: SizeManager.s20,
                          borderRadius:
                              BorderRadius.circular(RadiusManager.r24),
                          color: ColorManager.black87,
                          dotBorder: const DotBorder(
                            width: SizeManager.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: PaddingManager.p28),
                    child: Text(
                      StringsManager.splashText1,
                      style: StyleManager.splashText1TextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingManager.p28),
                    child: Text(
                      StringsManager.splashText2,
                      style: StyleManager.splashText2TextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingManager.p28),
                    child: Container(
                      height: SizeManager.s70,
                      width: SizeManager.s300,
                      decoration: BoxDecoration(
                        color: ColorManager.black87,
                        borderRadius: BorderRadius.circular(
                          RadiusManager.r40,
                        ),
                      ),
                      child: Dismissible(
                        key: const Key(StringsManager.key),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.loginRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(PaddingManager.p3),
                          child: Container(
                            height: SizeManager.s65,
                            width: SizeManager.s65,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(RadiusManager.r40),
                              color: ColorManager.limeGreen,
                            ),
                            child: const Icon(
                              Icons.double_arrow_rounded,
                              color: ColorManager.black87,
                              size: SizeManager.s40,
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
        ],
      ),
    );
  }
}
