import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/model/workout_model.dart';

class WorkoutProvider with ChangeNotifier {
  final List<WorkoutModel> _workouts = [];
  final List<WorkoutModel> _finishedWorkouts = [];

  List<WorkoutModel> get workouts {
    return [..._workouts];
  }

  List<WorkoutModel> get finishedWourkouts {
    return [..._finishedWorkouts];
  }

  Future<void> addNewWorkout({
    required String name,
    required int repNumber,
    required int setNumber,
    required DateTime dateTime,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future fetchAndSetWorkouts() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final mealsSnapshot = await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .get();

      final List<WorkoutModel> loadedWorkouts = [];

      for (var doc in mealsSnapshot.docs) {
        final workoutData = doc.data();
        loadedWorkouts.add(
          WorkoutModel(
            id: doc.id,
            name: workoutData['name'],
            repNumber: workoutData['repNumber'],
            setNumber: workoutData['setNumber'],
            dateTime: (workoutData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }
      _workouts.clear();
      _workouts.addAll(loadedWorkouts);

      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> clearWorkoutsIfDayChanges(DateTime lastDateTime) async {
    DateTime now = DateTime.now();

    if (isLastDateTimeDifferent(now, lastDateTime)) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('workouts')
            .doc(user!.uid)
            .collection('workoutData')
            .get()
            .then((workoutSnapshot) {
          for (var doc in workoutSnapshot.docs) {
            DateTime workoutDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isWorkoutDateDifferent(now, workoutDateTime)) {
              doc.reference.delete();
            }
          }
        });
        await FirebaseFirestore.instance
            .collection('finishedWorkouts')
            .doc(user.uid)
            .collection('finishedWorkoutsData')
            .get()
            .then((finishedWorkoutSnapshot) {
          for (var doc in finishedWorkoutSnapshot.docs) {
            DateTime workoutDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isWorkoutDateDifferent(now, workoutDateTime)) {
              doc.reference.delete();
            }
          }
        });
      } catch (e) {
        print(e);
      }
    }
  }

  bool isLastDateTimeDifferent(DateTime now, DateTime lastDateTime) {
    return now.year != lastDateTime.year ||
        now.month != lastDateTime.month ||
        now.day != lastDateTime.day;
  }

  bool isWorkoutDateDifferent(DateTime now, DateTime workoutDateTime) {
    return now.year != workoutDateTime.year ||
        now.month != workoutDateTime.month ||
        now.day != workoutDateTime.day;
  }

  Future<void> deleteWorkout(String workoutID) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .doc(workoutID)
          .delete();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> finishWorkout({
    required String workoutID,
    required String name,
    required int repNumber,
    required int setNumber,
    required DateTime dateTime,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('finishedWorkouts')
          .doc(user!.uid)
          .collection('finishedWorkoutsData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
        'id': workoutID,
      });
      notifyListeners();
    } catch (e) {
      notifyListeners();
      print(e);
    }
  }

  Future fetchAndSetFinshedWorkouts() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final mealsSnapshot = await FirebaseFirestore.instance
          .collection('finishedWorkouts')
          .doc(user!.uid)
          .collection('finishedWorkoutsData')
          .get();

      final List<WorkoutModel> loadedFinishedWorkouts = [];

      for (var doc in mealsSnapshot.docs) {
        final finishedWorkoutsData = doc.data();
        loadedFinishedWorkouts.add(
          WorkoutModel(
            id: doc.id,
            name: finishedWorkoutsData['name'],
            repNumber: finishedWorkoutsData['repNumber'],
            setNumber: finishedWorkoutsData['setNumber'],
            dateTime: (finishedWorkoutsData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }
      _finishedWorkouts.clear();
      _finishedWorkouts.addAll(loadedFinishedWorkouts);
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
