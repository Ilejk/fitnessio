import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';

class SettingsProvider with ChangeNotifier {
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<void> changePassword({
    required BuildContext context,
    required String email,
    required String oldPassword,
    required String newPassword,
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
      var credential =
          EmailAuthProvider.credential(email: email, password: oldPassword);
      await currentUser!.reauthenticateWithCredential(credential).then((value) {
        currentUser!.updatePassword(newPassword);
      });

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
