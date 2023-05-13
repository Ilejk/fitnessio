import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final List<double> _weight = [];

  List<double> get weight {
    return [..._weight];
  }

  final List<FlSpot> _flSpots = [];

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
    required DateTime weightDateTime,
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
        'weightDateTime': weightDateTime,
      });

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
