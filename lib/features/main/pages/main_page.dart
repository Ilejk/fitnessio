import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/main/widgets/appbar_consumption.dart';
import 'package:smart_home_app/features/main/widgets/appbar_profile.dart';
import 'package:smart_home_app/features/main/widgets/appbar_workouts.dart';
import 'package:smart_home_app/features/main/widgets/appbar_settings.dart';
import 'package:smart_home_app/features/consumption/pages/consumption_page.dart';
import 'package:smart_home_app/features/home/pages/home_page.dart';
import 'package:smart_home_app/features/main/widgets/appbar_home.dart';
import 'package:smart_home_app/features/profile/pages/profile_page.dart';
import 'package:smart_home_app/features/workouts/pages/workouts_page.dart';
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
    ConsumptionPage(),
    WorkoutPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  appBar() {
    if (isHomePage) {
      return const HomePageAppBarWidget();
    } else if (isConsumptionPage) {
      return const ConsumptionPageAppBarWidget();
    } else if (isWorkoutsPage) {
      return const WorkoutsPageAppBarWidget();
    } else if (isSettingsPage) {
      return const SettingsPageAppBarWidget();
    } else if (isProfilePage) {
      return const ProfilePageAppBarWidget();
    }
  }

  bool get isProfilePage => _currentIndex == 4;

  bool get isSettingsPage => _currentIndex == 3;

  bool get isWorkoutsPage => _currentIndex == 2;

  bool get isConsumptionPage => _currentIndex == 1;

  bool get isHomePage => _currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavItems = [
      Icon(
        Icons.other_houses_outlined,
        color: isHomePage ? ColorManager.limerGreen2 : ColorManager.grey2,
        size: SizeManager.s28,
      ),
      Icon(
        Icons.fastfood_outlined,
        color:
            isConsumptionPage ? ColorManager.limerGreen2 : ColorManager.grey2,
        size: SizeManager.s28,
      ),
      Icon(
        Icons.list,
        color: isWorkoutsPage ? ColorManager.limerGreen2 : ColorManager.grey2,
        size: SizeManager.s28,
      ),
      Icon(
        Icons.settings_outlined,
        color: isSettingsPage ? ColorManager.limerGreen2 : ColorManager.grey2,
        size: SizeManager.s28,
      ),
      Icon(
        Icons.person_4_outlined,
        color: isSettingsPage ? ColorManager.limerGreen2 : ColorManager.grey2,
        size: SizeManager.s28,
      ),
    ];
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          isProfilePage ? SizeManager.s0 : SizeManager.s60,
        ),
        child: appBar(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: ColorManager.black87,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: ColorManager.darkGrey,
        onTap: ontap,
        index: _currentIndex,
        items: bottomNavItems,
      ),
      body: pages[_currentIndex].animate().fadeIn(duration: 500.ms),
    );
  }
}
