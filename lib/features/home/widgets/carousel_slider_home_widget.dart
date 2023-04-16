import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/home/widgets/carousel_home_box.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';

class CarouselSliderHomeWidget extends StatelessWidget {
  const CarouselSliderHomeWidget({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel1WP,
          onTap: () {},
          title: 'STRENGH',
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel2WP,
          onTap: () {},
          title: 'YOGA',
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel3WP,
          onTap: () {},
          title: 'POWER',
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel4WP,
          onTap: () {},
          title: 'CONFIDENCE',
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel5WP,
          onTap: () {},
          title: 'MEDITATION',
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
