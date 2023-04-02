import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  AuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      print(_user);
      notifyListeners();
    });
  }
  void callAth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      print(_user);
      notifyListeners();
    });
  }

  User? get user => _user;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
