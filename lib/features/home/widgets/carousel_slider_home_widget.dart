import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/home/widgets/carousel_home_box.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';

class CarouselSliderHomeWidget extends StatelessWidget {
  const CarouselSliderHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: [
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel1WP,
          onTap: () {
            //TODO
          },
          title: StringsManager.strengh,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel2WP,
          onTap: () {
            //TODO
          },
          title: StringsManager.yoga,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel3WP,
          onTap: () {
            //TODO
          },
          title: StringsManager.power,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel4WP,
          onTap: () {
            //TODO
          },
          title: StringsManager.meditation,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel5WP,
          onTap: () {
            //TODO
          },
          title: StringsManager.confidence,
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
