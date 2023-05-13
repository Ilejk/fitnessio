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

class TodaysProgressWidget extends StatelessWidget {
  const TodaysProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<WorkoutProvider>(builder: (context, workoutProvider, _) {
      var isLoaded = workoutProvider.progressPercent == null ||
          workoutProvider.shownPercent == null ||
          workoutProvider.exercisesLeft == null;

      if (isLoaded) {
        return SpinKitSpinningLines(color: ColorManager.limerGreen2);
      } else {
        workoutProvider.getProgressPercent();
        double progressPercent = workoutProvider.progressPercent!;
        double shownPercent = workoutProvider.shownPercent!;
        int exercisesLeft = workoutProvider.exercisesLeft!;

        var isResetDay = progressPercent.isNaN &&
            shownPercent.isNaN &&
            workoutProvider.workouts.isEmpty &&
            workoutProvider.finishedWourkouts.isEmpty;
        if (isResetDay) {
          progressPercent = 0.0;
          shownPercent = 0.0;
        }

        Text subText(WorkoutProvider workoutProvider, int exercisesLeft) {
          if (workoutProvider.finishedWourkouts.isNotEmpty &&
              exercisesLeft != 0) {
            return Text(
              '$exercisesLeft Exercises Left',
              style: StyleManager.homePageS14RegularWhite2L1,
              textAlign: TextAlign.left,
            );
          } else if (workoutProvider.finishedWourkouts.isEmpty &&
              workoutProvider.workouts.isEmpty) {
            return Text(
              StringsManager.startYourExercises,
              style: StyleManager.homePageS14RegularWhite2L1,
              textAlign: TextAlign.left,
            );
          } else if (workoutProvider.finishedWourkouts.isNotEmpty &&
              workoutProvider.workouts.isEmpty) {
            return Text(
              StringsManager.exercisesDoneTxt,
              style: StyleManager.homePageS14RegularWhite2L1,
              textAlign: TextAlign.left,
            );
          } else {
            return Text(
              StringsManager.error,
              style: StyleManager.homePageS14RegularWhite2L1,
              textAlign: TextAlign.left,
            );
          }
        }

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
                          style: StyleManager.homePageTodaysProgressTextSTyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: PaddingManager.p12,
                          right: PaddingManager.p20,
                          left: PaddingManager.p20,
                        ),
                        child: subText(workoutProvider, exercisesLeft),
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
                      animation: true,
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
