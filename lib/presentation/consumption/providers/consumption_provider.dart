import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/model/meal_model.dart';
import 'package:smart_home_app/model/water_model.dart';

class ConsumptionProvider with ChangeNotifier {
  final List<MealModel> _meals = [];
  final List<WaterModel> _water = [];
  double kCalaDay = 0.0;
  double waterADay = 0.0;

  List<MealModel> get meals {
    return [..._meals];
  }

  List<WaterModel> get water {
    return [..._water];
  }

  Future<void> addNewMeal({
    required String title,
    required double amount,
    required double calories,
    required double fats,
    required double carbs,
    required double proteins,
    required DateTime dateTime,
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
        'fats': fats,
        'carbs': carbs,
        'proteins': proteins,
        'dateTime': dateTime,
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAndSetMeals() async {
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
          fats: mealData['fats'],
          carbs: mealData['carbs'],
          proteins: mealData['proteins'],
          dateTime: (mealData['dateTime'] as Timestamp).toDate(),
        ));
      }
      loadedMeals.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      _meals.clear();
      _meals.addAll(loadedMeals);
      await getkCal();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  getkCal() async {
    kCalaDay = 0.0;
    for (var meal in _meals) {
      kCalaDay += meal.calories;
    }
    notifyListeners();
  }

  Future<void> clearMealsIfDayChanges(DateTime lastDateTime) async {
    DateTime now = DateTime.now();

    if (isLastDateTimeDifferent(now, lastDateTime)) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('meals')
            .doc(user!.uid)
            .collection('mealData')
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            DateTime mealDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isInputTimeDifferent(now, mealDateTime)) {
              doc.reference.delete();
            }
          }
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  bool isLastDateTimeDifferent(DateTime now, DateTime lastDateTime) {
    return now.year != lastDateTime.year ||
        now.month != lastDateTime.month ||
        now.day != lastDateTime.day;
  }

  bool isInputTimeDifferent(DateTime now, DateTime inputDateTime) {
    return now.year != inputDateTime.year ||
        now.month != inputDateTime.month ||
        now.day != inputDateTime.day;
  }

  Future<void> addWater({
    required double amount,
    required DateTime dateTime,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('meals')
          .doc(user!.uid)
          .collection('waterData')
          .doc()
          .set({
        'amount': amount,
        'dateTime': dateTime,
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAndSetWater() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final mealsSnapshot = await FirebaseFirestore.instance
          .collection('meals')
          .doc(user!.uid)
          .collection('waterData')
          .get();

      final List<WaterModel> loadedWater = [];

      for (var doc in mealsSnapshot.docs) {
        final mealData = doc.data();
        loadedWater.add(WaterModel(
          id: doc.id,
          amount: mealData['amount'],
          dateTime: (mealData['dateTime'] as Timestamp).toDate(),
        ));
      }
      _water.clear();
      _water.addAll(loadedWater);
      await getWater();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  getWater() async {
    waterADay = 0.0;
    for (var water in _water) {
      waterADay += water.amount;
    }
    notifyListeners();
  }

  Future<void> clearWaterIfDayChanges(DateTime lastDateTime) async {
    DateTime now = DateTime.now();

    if (isLastDateTimeDifferent(now, lastDateTime)) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('meals')
            .doc(user!.uid)
            .collection('waterData')
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            DateTime waterDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isInputTimeDifferent(now, waterDateTime)) {
              doc.reference.delete();
            }
          }
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteMeal(String mealID) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('meals')
          .doc(user!.uid)
          .collection('mealData')
          .doc(mealID)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
