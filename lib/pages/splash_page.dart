import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/asset_manager.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/route_manager.dart';
import 'package:smart_home_app/resources/string_manager.dart';
import 'package:smart_home_app/resources/style_manager.dart';
import 'package:smart_home_app/resources/value_manager.dart';
import 'package:smart_home_app/resources/widgets/slider_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: DurationManager.s5),
        (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;
      _pageController.animateToPage(
        nextPage % imgList.length,
        duration: const Duration(milliseconds: DurationManager.ms300),
        curve: Curves.easeInOut,
      );
    });
  }

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
            onPageChanged: (value) {
              if (value == imgList.length - 1) {
                Future.delayed(
                  const Duration(seconds: DurationManager.s5),
                ).then(
                  (value) => _pageController.animateToPage(
                    0,
                    duration:
                        const Duration(milliseconds: DurationManager.ms300),
                    curve: Curves.easeInOut,
                  ),
                );
              }
            },
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
                  const Padding(
                    padding: EdgeInsets.only(top: PaddingManager.p28),
                    child: Text(
                      StringsManager.splashText2,
                      style: StyleManager.splashText2TextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SliderWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
