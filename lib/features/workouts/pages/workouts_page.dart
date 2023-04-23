import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/meal_widget.dart';
import 'package:smart_home_app/features/workouts/providers/workout_provider.dart';
import 'package:smart_home_app/features/workouts/widgets/new_exercise_button.dart';
import 'package:smart_home_app/features/workouts/widgets/exercise_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final workoutsProvider =
          Provider.of<WorkoutProvider>(context, listen: false);
      await workoutsProvider.fetchAndSetWorkouts();
      final workouts = workoutsProvider.workouts;

      if (workouts.isNotEmpty) {
        final lastWorkoutDateTime = workouts.last.dateTime;
        final now = DateTime.now();
        if (now.year > lastWorkoutDateTime.year ||
            now.month > lastWorkoutDateTime.month ||
            now.day > lastWorkoutDateTime.day) {
          await workoutsProvider.clearWorkoutsIfDayChanges(lastWorkoutDateTime);
        }
      }
    });
  }

  Future<void> _handleRefresh() async {
    setState(() {
      Provider.of<WorkoutProvider>(context, listen: false)
          .fetchAndSetWorkouts();
    });

    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final workoutsProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    return SafeArea(
      child: LiquidPullToRefresh(
        height: SizeManager.s250,
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
                          Navigator.of(context)
                              .pushNamed(Routes.addNewExerciseRoute);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: workoutsProvider.workouts.length,
                        itemBuilder: (context, index) {
                          return ExerciseWidget(
                            name: workoutsProvider.workouts[index].name,
                            repNumber:
                                workoutsProvider.workouts[index].repNumber,
                            setNumber:
                                workoutsProvider.workouts[index].setNumber,
                            id: workoutsProvider.workouts[index].id,
                            onPressed: (_) {
                              setState(() {
                                workoutsProvider.deleteWorkout(
                                  workoutsProvider.workouts[index].id,
                                );
                              });
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
    );
  }
}
