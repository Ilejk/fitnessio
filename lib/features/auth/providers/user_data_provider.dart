import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  Future addUserData({
    required String email,
    required String name,
    required String surname,
    required int age,
    required double height,
    required double weight,
    required double waist,
    required double hip,
    required double arm,
    required double chest,
    required String gender,
    required double thigh,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'email': email,
        'first name': name,
        'surname': surname,
        'age': age,
        'height': height,
        'weight': weight,
        'waist': waist,
        'hip': hip,
        'arm': arm,
        'chest': chest,
        'gender': gender,
        'thigh': thigh,
      });

      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
