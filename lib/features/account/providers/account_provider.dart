import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
