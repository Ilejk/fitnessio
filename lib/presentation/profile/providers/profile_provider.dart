import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final List<double> _weight = [];

  List<double> get weight {
    return [..._weight];
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
      print(e);
      rethrow;
    }
  }
}
