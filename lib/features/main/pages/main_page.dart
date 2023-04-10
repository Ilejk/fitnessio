import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/Menu/pages/menu_page.dart';
import 'package:smart_home_app/features/home/pages/home_page.dart';
import 'package:smart_home_app/features/main/widgets/appbar_main.dart';
import 'package:smart_home_app/features/security/pages/security_page.dart';
import 'package:smart_home_app/features/settings/pages/settings_page.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  ontap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = const [
    HomePage(),
    MenuPage(),
    SecurityPage(),
    SettingsPage(),
  ];
  List<Widget> bottomNavItems = [
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
  ];

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
        onTap: ontap,
        index: _currentIndex,
        items: bottomNavItems,
      ),
      body: pages[_currentIndex].animate().fadeIn(duration: 500.ms),
    );
  }
}
