import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final Map<String, dynamic> _userData = {};
  double usersBMR = 0.0;
  double basicBMR = 0.0;

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        _userData['first name'] = userDataSnapshot.get('first name');
        _userData['surname'] = userDataSnapshot.get('surname');
        _userData['age'] = userDataSnapshot.get('age');
        _userData['height'] = userDataSnapshot.get('height');
        _userData['weight'] = userDataSnapshot.get('weight');
        _userData['gender'] = userDataSnapshot.get('gender');
        _userData['activity'] = userDataSnapshot.get('activity');
        _userData['bmr'] = userDataSnapshot.get('bmr');

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return _userData;
  }

  Map<String, dynamic> get userData => _userData;

  Future getUsersBMR({
    required String gender,
    required double weight,
    required double height,
    required int age,
    required String activity,
  }) async {
    const double low = 1.2;
    const double light = 1.375;
    const double moderate = 1.55;
    const double high = 1.725;
    const double veryhigh = 1.9;

    var isMan = gender == 'MAN';
    var isWoman = gender == 'WOMAN';
    if (isMan) {
      basicBMR = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (isWoman) {
      basicBMR = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
    var isActivityLow = activity == 'LOW';
    var isActivityLight = activity == 'LIGHT';
    var isActivityModerate = activity == 'MODERATE';
    var isActivityHigh = activity == 'HIGH';
    var isActivityVeryHigh = activity == 'VERY HIGH';

    if (isActivityLow) {
      usersBMR = basicBMR * low;
    } else if (isActivityLight) {
      usersBMR = basicBMR * light;
    } else if (isActivityModerate) {
      usersBMR = basicBMR * moderate;
    } else if (isActivityHigh) {
      usersBMR = basicBMR * high;
    } else if (isActivityVeryHigh) {
      usersBMR = basicBMR * veryhigh;
    }
    return usersBMR;
  }
}
