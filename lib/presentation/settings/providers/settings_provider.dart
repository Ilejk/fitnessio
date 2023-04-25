import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_home_app/data/db.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';

class SettingsProvider with ChangeNotifier {
  var currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> changeEmail({
    required BuildContext context,
    required String oldEmail,
    required String newEmail,
    required String password,
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
          EmailAuthProvider.credential(email: oldEmail, password: password);
      await currentUser!.reauthenticateWithCredential(credential).then((value) {
        currentUser!.updateEmail(newEmail);
      });

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> deleteUser(
      {required String email, required String password}) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      UserCredential result =
          await user!.reauthenticateWithCredential(credential);
      await DataBase(result.user!.uid).deleteUserData();
      await result.user!.delete();
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> signOut({
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
    } on FirebaseAuthException catch (_) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) {
          Navigator.pop(context);

          notifyListeners();
        },
      );
    }
  }

  Future<void> changeUsersHeight({
    required double height,
    required double bmi,
    required double bmr,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'height': height,
        'bmi': bmi,
        'bmr': bmr,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> changeUsersWeight({
    required double weight,
    required double bmi,
    required double bmr,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'weight': weight,
        'bmi': bmi,
        'bmr': bmr,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> changeUsersActivity({
    required String activity,
    required double bmr,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'activity': activity,
        'bmr': bmr,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> changeUsersGaols({
    required String goal,
    required double bmr,
    required BuildContext context,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'goal': goal,
        'bmr': bmr,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}