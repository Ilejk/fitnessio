import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final Map<String, dynamic> _userData = {};

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
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return _userData;
  }

  Map<String, dynamic> get userData => _userData;
}
