import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/main/widgets/appbar_menu.dart';
import 'package:smart_home_app/features/main/widgets/appbar_security.dart';
import 'package:smart_home_app/features/main/widgets/appbar_settings.dart';
import 'package:smart_home_app/features/exercises/pages/exercises_page.dart';
import 'package:smart_home_app/features/home/pages/home_page.dart';
import 'package:smart_home_app/features/main/widgets/appbar_home.dart';
import 'package:smart_home_app/features/my_workouts/pages/my_workouts_page.dart';
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
      Icons.list,
      color: ColorManager.limerGreen2,
      size: SizeManager.s28,
    ),
    Icon(
      Icons.data_saver_off_sharp,
      color: ColorManager.limerGreen2,
      size: SizeManager.s28,
    ),
    Icon(
      Icons.settings_outlined,
      color: ColorManager.limerGreen2,
      size: SizeManager.s28,
    ),
  ];
  appBar() {
    if (isHomePage) {
      return const HomePageAppBarWidget();
    } else if (isExercisesPage) {
      return const ExercisesPageAppBarWidget();
    } else if (isMyWorkoutsPage) {
      return const MyWorkoutsPageAppBarWidget();
    } else if (isSettingsPage) {
      return const SettingsPageAppBarWidget();
    }
  }

  bool get isSettingsPage => _currentIndex == 3;

  bool get isMyWorkoutsPage => _currentIndex == 2;

  bool get isExercisesPage => _currentIndex == 1;

  bool get isHomePage => _currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, SizeManager.s60),
        child: appBar(),
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
