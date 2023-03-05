import 'package:fitnessio/presentation/pages/all_body_parts_page/all_body_parts_page.dart';
import 'package:fitnessio/presentation/pages/all_exercise_list_page/all_exercises_list_page.dart';
import 'package:fitnessio/presentation/pages/create_a_new_workout_plan_page/create_a_new_workout_plan_page.dart';
import 'package:fitnessio/presentation/pages/create_an_account_page/created_an_account_page.dart';
import 'package:fitnessio/presentation/pages/detail_exercise_page/detail_exercise_page.dart';
import 'package:fitnessio/presentation/pages/main_home_page/main_home_page.dart';
import 'package:fitnessio/presentation/pages/main_starting_page/main_starting_page_page.dart';
import 'package:fitnessio/presentation/pages/my_profile_page/my_profile_page.dart';
import 'package:fitnessio/presentation/pages/my_workout_list_page/my_workout_list_page.dart';
import 'package:fitnessio/presentation/resources/managers/string_manager.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String mainStartingPage = '/';
  static const String createAnAccountPage = '/createAnAccountPage';
  static const String mainHomePage = '/mainHomePage';
  static const String allBodyPartsPage = '/allBodyPartsPage';
  static const String allExercisesListPage = '/allExercisesListPage';
  static const String createNewWorkoutPlanPage = '/createNewWorkoutPlanPage';
  static const String detailedExercisesPage = '/detailedExercisesPage';
  static const String myProfilePage = '/myProfilePage';
  static const String myWorkoutListPage = '/myWorkoutListPage';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainStartingPage:
        return MaterialPageRoute(builder: (_) => const MainStartingPage());
      case Routes.createAnAccountPage:
        return MaterialPageRoute(builder: (_) => const CreateNewAccountPage());
      case Routes.mainHomePage:
        return MaterialPageRoute(builder: (_) => const MainHomePage());
      case Routes.allBodyPartsPage:
        return MaterialPageRoute(builder: (_) => const AllBodyPartsPage());
      case Routes.allExercisesListPage:
        return MaterialPageRoute(builder: (_) => const AllExercisesListPage());
      case Routes.createNewWorkoutPlanPage:
        return MaterialPageRoute(
            builder: (_) => const CreateNewWorkoutPlanPage());
      case Routes.detailedExercisesPage:
        return MaterialPageRoute(builder: (_) => const DetailExercisePage());
      case Routes.myProfilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.myWorkoutListPage:
        return MaterialPageRoute(builder: (_) => const WorkoutListPage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
