import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/home/widgets/fitness_data_widget.dart';
import 'package:smart_home_app/features/home/widgets/carousel_slider_home_widget.dart';
import 'package:smart_home_app/features/home/widgets/home_page_text_spacer_widget.dart';
import 'package:smart_home_app/features/home/widgets/todays_progress_widget.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TodaysProgressWidget(),
            HomePageTextSpacerWidget(
              title: StringsManager.todaysAct,
            ),
            FitnessDataWidget(),
            HomePageTextSpacerWidget(
              title: StringsManager.explore,
            ),
            CarouselSliderHomeWidget()
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
