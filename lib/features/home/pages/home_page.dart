import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/home/providers/home_provider.dart';
import 'package:smart_home_app/features/home/widgets/bottom_data_widget.dart';
import 'package:smart_home_app/features/home/widgets/carousel_slider_home_widget.dart';
import 'package:smart_home_app/features/home/widgets/todays_activity_spacer_widget.dart';
import 'package:smart_home_app/features/home/widgets/todays_progress_widget.dart';

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
            const TodaysActivitySpacerWidget(),
            BottomDataWidget(deviceWidth: deviceWidth),
            CarouselSliderHomeWidget(deviceWidth: deviceWidth)
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
