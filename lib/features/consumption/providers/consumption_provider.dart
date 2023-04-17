import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/model/meal_model.dart';

class ConsumptionProvider with ChangeNotifier {
  final List<MealModel> _meals = [];
  List<MealModel> get meals {
    return [..._meals];
  }

  Future<void> addNewMeal({
    required String title,
    required double amount,
    required double calories,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('meals')
          .doc(user!.uid)
          .collection('mealData')
          .doc()
          .set({
        'title': title,
        'amount': amount,
        'calories': calories,
      });
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> fetchAndSetMeals() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final mealsSnapshot = await FirebaseFirestore.instance
          .collection('meals')
          .doc(user!.uid)
          .collection('mealData')
          .get();

      final List<MealModel> loadedMeals = [];

      for (var doc in mealsSnapshot.docs) {
        final mealData = doc.data();
        loadedMeals.add(MealModel(
          id: doc.id,
          title: mealData['title'],
          amount: mealData['amount'],
          calories: mealData['calories'],
        ));
      }

      _meals.addAll(loadedMeals);
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
