import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/home/widgets/appbar_home.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, SizeManager.s60),
        child: HomePageAppBarWidget(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: ColorManager.black87,
        buttonBackgroundColor: ColorManager.darkGrey,
        backgroundColor: ColorManager.darkGrey,
        items: [
          Icon(
            Icons.other_houses_outlined,
            color: ColorManager.limerGreen2,
            size: SizeManager.s28,
          ),
          Icon(
            Icons.menu,
            color: ColorManager.limerGreen2,
            size: SizeManager.s28,
          ),
          Icon(
            Icons.security_sharp,
            color: ColorManager.limerGreen2,
            size: SizeManager.s28,
          ),
          Icon(
            Icons.settings_outlined,
            color: ColorManager.limerGreen2,
            size: SizeManager.s28,
          ),
        ],
      ),
      body: Column().animate().fadeIn(duration: 500.ms),
    );
  }
}
