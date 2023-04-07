import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Lottie.asset(AnimationManager.smallLock),
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) {
          Navigator.pop(context);
          _isLoading = false;
          notifyListeners();
        },
      );
    }
  }
}
