import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final List<double> _weight = [];

  List<double> get weight {
    return [..._weight];
  }

  final List<FlSpot> _flSpots = [
    const FlSpot(
      1.0,
      10,
    ),
    const FlSpot(
      2.0,
      10,
    ),
    const FlSpot(
      3.0,
      10,
    ),
    const FlSpot(
      4.0,
      10,
    ),
    const FlSpot(
      5.0,
      10,
    ),
    const FlSpot(
      6.0,
      10,
    ),
    const FlSpot(
      7.0,
      10,
    ),
    const FlSpot(
      8.0,
      10,
    ),
    const FlSpot(
      9.0,
      10,
    ),
    const FlSpot(
      10.0,
      10,
    ),
    const FlSpot(
      11.0,
      10,
    ),
    const FlSpot(
      12.0,
      10,
    ),
  ];

  List<FlSpot> get flSpots {
    return [..._flSpots];
  }

  Future<void> fetchAndSetWeight() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final double? weight = snapshot.get('weight');
      if (weight != null) {
        _weight.add(weight);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeUsersWeight({
    required double weight,
    required double bmi,
    required double bmr,
    required int weightDateTime,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'weight': weight,
        'bmi': bmi,
        'bmr': bmr,
      });

      final docSnapshot = await FirebaseFirestore.instance
          .collection('flSpots')
          .doc(user.uid)
          .collection('flSpotsData')
          .where('weightDateTime', isEqualTo: weightDateTime)
          .get();

      if (docSnapshot.docs.isNotEmpty) {
        final docId = docSnapshot.docs.first.id;
        await FirebaseFirestore.instance
            .collection('flSpots')
            .doc(user.uid)
            .collection('flSpotsData')
            .doc(docId)
            .update(
          {
            'weight': weight,
          },
        );
      } else {
        await FirebaseFirestore.instance
            .collection('flSpots')
            .doc(user.uid)
            .collection('flSpotsData')
            .doc()
            .set(
          {
            'weight': weight,
            'weightDateTime': weightDateTime,
          },
        );
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchAndSetFlSpots() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final flSpotSnapshot = await FirebaseFirestore.instance
          .collection('flSpots')
          .doc(user!.uid)
          .collection('flSpotsData')
          .get();

      final List<FlSpot> loadedFlSpots = [];

      for (var doc in flSpotSnapshot.docs) {
        final flspotsData = doc.data();
        int month = flspotsData['weightDateTime'];

        int index = _flSpots.indexWhere((spot) => spot.x == month.toDouble());
        if (index != -1) {
          _flSpots[index] = FlSpot(
            month.toDouble(),
            flspotsData['weight'],
          );
        } else {
          loadedFlSpots.add(
            FlSpot(
              month.toDouble(),
              flspotsData['weight'],
            ),
          );
        }
      }
      _flSpots.addAll(loadedFlSpots);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUsersData({
    required String activity,
    required String goal,
    required double chest,
    required double shoulders,
    required double biceps,
    required double foreArm,
    required double waist,
    required double hips,
    required double thigh,
    required double calf,
    required double bmr,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'activity': activity,
        'bmr': bmr,
        'goal': goal,
        'chest': chest,
        'shoulders': shoulders,
        'biceps': biceps,
        'foreArm': foreArm,
        'waist': waist,
        'hips': hips,
        'thigh': thigh,
        'calf': calf,
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
