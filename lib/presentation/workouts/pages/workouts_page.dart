import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/workouts/providers/workout_provider.dart';
import 'package:smart_home_app/presentation/workouts/widgets/new_exercise_button.dart';
import 'package:smart_home_app/presentation/workouts/widgets/exercise_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Future<void> _handleRefresh() async {
    setState(() {
      Provider.of<WorkoutProvider>(context, listen: false)
          .fetchAndSetWorkouts();
    });
    return await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, workoutsProvider, _) => SafeArea(
        child: LiquidPullToRefresh(
          height: SizeManager.s250.h,
          color: ColorManager.darkGrey,
          animSpeedFactor: 2,
          backgroundColor: ColorManager.white2,
          onRefresh: _handleRefresh,
          child: FutureBuilder<void>(
            future: workoutsProvider.fetchAndSetWorkouts(),
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: NewExerciseButton(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.addNewExerciseRoute,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: workoutsProvider.workouts.length,
                          itemBuilder: (context, index) {
                            final workout = workoutsProvider.workouts[index];
                            return ExerciseWidget(
                              name: workout.name,
                              repNumber: workout.repNumber,
                              setNumber: workout.setNumber,
                              id: workout.id,
                              onDeleted: (_) {
                                setState(() {
                                  workoutsProvider.deleteWorkout(
                                    workout.id,
                                  );
                                });
                              },
                              onFinished: (_) {
                                setState(
                                  () {
                                    workoutsProvider.finishWorkout(
                                      workoutID: workout.id,
                                      name: workout.name,
                                      repNumber: workout.repNumber,
                                      setNumber: workout.setNumber,
                                      dateTime: workout.dateTime,
                                    );
                                    workoutsProvider.deleteWorkout(
                                      workout.id,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
