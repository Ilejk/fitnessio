import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/model/workout_model.dart';

class WorkoutProvider with ChangeNotifier {
  final List<WorkoutModel> _workouts = [];
  final List<WorkoutModel> _finishedWorkouts = [];
  final List<WorkoutModel> _allWorkouts = [];
  double progressPercent = 0.0;
  int exercisesLeft = 0;
  double shownPercent = 0.0;

  List<WorkoutModel> get workouts {
    return [..._workouts];
  }

  List<WorkoutModel> get finishedWourkouts {
    return [..._finishedWorkouts];
  }

  List<WorkoutModel> get allWorkouts {
    return [..._allWorkouts];
  }

  Future<void> getProgressPercent() async {
    final int allWorkoutsNum = _allWorkouts.length;
    final int finishedWorkoutsNum = _finishedWorkouts.length;
    progressPercent = finishedWorkoutsNum / allWorkoutsNum;
    shownPercent = progressPercent * 100;
    exercisesLeft = allWorkoutsNum - finishedWorkoutsNum;
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
      await FirebaseFirestore.instance
          .collection('allWorkouts')
          .doc(user.uid)
          .collection('allWorkoutsData')
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
      final workoutSnapshot = await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .get();
      final allWorkoutSnapshot = await FirebaseFirestore.instance
          .collection('allWorkouts')
          .doc(user.uid)
          .collection('allWorkoutsData')
          .get();
      final finishedworkoutSnapshot = await FirebaseFirestore.instance
          .collection('finishedWorkouts')
          .doc(user.uid)
          .collection('finishedWorkoutsData')
          .get();

      final List<WorkoutModel> loadedWorkouts = [];
      final List<WorkoutModel> allworkoutsLoaded = [];
      final List<WorkoutModel> loadedFinishedWorkouts = [];

      for (var doc in workoutSnapshot.docs) {
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
      for (var doc in allWorkoutSnapshot.docs) {
        final allWorkoutData = doc.data();
        allworkoutsLoaded.add(
          WorkoutModel(
            id: doc.id,
            name: allWorkoutData['name'],
            repNumber: allWorkoutData['repNumber'],
            setNumber: allWorkoutData['setNumber'],
            dateTime: (allWorkoutData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }

      for (var doc in finishedworkoutSnapshot.docs) {
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

      _workouts.clear();
      _workouts.addAll(loadedWorkouts);
      _allWorkouts.clear();
      _allWorkouts.addAll(allworkoutsLoaded);
      _finishedWorkouts.clear();
      _finishedWorkouts.addAll(loadedFinishedWorkouts);

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
        await FirebaseFirestore.instance
            .collection('allWorkouts')
            .doc(user.uid)
            .collection('allWorkoutsData')
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
}
