import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  Future<void> addUserData({
    required String email,
    required String name,
    required String surname,
    required int age,
    required String houseID,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'email': email,
        'first name': name,
        'surname': surname,
        'age': age,
        'houseID': houseID,
      });

      notifyListeners();
    } catch (_) {
      notifyListeners();
    }
  }
}
