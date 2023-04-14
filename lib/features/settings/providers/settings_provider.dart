import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';

class SettingsProvider with ChangeNotifier {
  Future<void> changeEmail({
    required BuildContext context,
  }) async {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: SpinKitSpinningLines(color: ColorManager.limerGreen2),
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signOut();

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
