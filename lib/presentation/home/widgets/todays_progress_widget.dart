import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/workouts/providers/workout_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class TodaysProgressWidget extends StatefulWidget {
  const TodaysProgressWidget({
    super.key,
  });

  @override
  State<TodaysProgressWidget> createState() => _TodaysProgressWidgetState();
}

class _TodaysProgressWidgetState extends State<TodaysProgressWidget> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    return FutureBuilder<void>(
        future: workoutProvider.fetchAndSetWorkouts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitSpinningLines(color: ColorManager.limerGreen2);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            double progressPercent = workoutProvider.progressPercent;
            double shownPercent = workoutProvider.shownPercent;
            int exercisesLeft = workoutProvider.exercisesLeft;

            return Padding(
              padding: const EdgeInsets.only(
                top: PaddingManager.p28,
                left: PaddingManager.p12,
                right: PaddingManager.p12,
              ),
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: ColorManager.black87,
                  borderRadius: BorderRadius.circular(
                    RadiusManager.r40.r,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: PaddingManager.p12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: PaddingManager.p12,
                              right: PaddingManager.p20,
                              left: PaddingManager.p20,
                            ),
                            child: Text(
                              StringsManager.todaysProg,
                              style:
                                  StyleManager.homePageTodaysProgressTextSTyle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: PaddingManager.p12,
                              right: PaddingManager.p20,
                              left: PaddingManager.p20,
                            ),
                            child: Text(
                              '${exercisesLeft} Exercises Left',
                              style: StyleManager.homePageS14RegularWhite2L1,
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: PaddingManager.p12,
                          right: PaddingManager.p20,
                          left: PaddingManager.p20,
                        ),
                        child: CircularPercentIndicator(
                          circularStrokeCap: CircularStrokeCap.round,
                          radius: RadiusManager.r40.r,
                          lineWidth: SizeManager.s8.w,
                          percent: progressPercent,
                          progressColor: ColorManager.limerGreen2,
                          backgroundColor: ColorManager.grey3,
                          animateFromLastPercent: true,
                          center: Text(
                            '${shownPercent.toStringAsFixed(0)}%',
                            style: StyleManager.homePagePogressBarTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
