import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final Map<String, dynamic> _userData = {};
  double usersBMR = 0.0;
  double basicBMR = 0.0;
  double userBMRwithGoal = 0.0;
  double usersBMI = 0.0;

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
        _userData['goal'] = userDataSnapshot.get('goal');
        _userData['bmi'] = userDataSnapshot.get('bmi');
        _userData['email'] = userDataSnapshot.get('email');
        _userData['chest'] = userDataSnapshot.get('chest');
        _userData['shoulders'] = userDataSnapshot.get('shoulders');
        _userData['biceps'] = userDataSnapshot.get('biceps');
        _userData['foreArm'] = userDataSnapshot.get('foreArm');
        _userData['waist'] = userDataSnapshot.get('waist');
        _userData['hips'] = userDataSnapshot.get('hips');
        _userData['thigh'] = userDataSnapshot.get('thigh');
        _userData['calf'] = userDataSnapshot.get('calf');

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return _userData;
  }

  Map<String, dynamic> get userData => _userData;

  Future<double> getUsersBMR({
    required String gender,
    required double weight,
    required double height,
    required int age,
    required String activity,
    required String goal,
  }) async {
    const double low = 1.2;
    const double light = 1.375;
    const double moderate = 1.55;
    const double high = 1.725;
    const double veryhigh = 1.9;

    var isMan = gender == 'MAN';
    var isWoman = gender == 'WOMAN';
    if (isMan) {
      var manBmrEquation =
          88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      basicBMR = manBmrEquation;
    } else if (isWoman) {
      var womanBmrEquation =
          447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      basicBMR = womanBmrEquation;
    }

    switch (activity) {
      case 'LOW':
        usersBMR = basicBMR * low;
        break;
      case 'LIGHT':
        usersBMR = basicBMR * light;
        break;
      case 'MODERATE':
        usersBMR = basicBMR * moderate;
        break;
      case 'HIGH':
        usersBMR = basicBMR * high;
        break;
      case 'VERY HIGH':
        usersBMR = basicBMR * veryhigh;
        break;
      default:
        throw Exception('Invalid activity level');
    }

    switch (goal) {
      case 'LOSE':
        userBMRwithGoal = usersBMR - (usersBMR * 0.2);
        break;
      case 'MAINTAIN':
        userBMRwithGoal = usersBMR;
        break;
      case 'GAIN':
        userBMRwithGoal = usersBMR + (usersBMR * 0.2);
        break;

      default:
        throw Exception('Invalid goal');
    }

    return userBMRwithGoal;
  }

  Future<double> getUsersBMI({
    required double height,
    required double weight,
  }) async {
    double heightInMeters = height / 100;
    usersBMI = (weight / (heightInMeters * heightInMeters));
    return usersBMI;
  }
}
