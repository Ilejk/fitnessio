import 'package:flutter/material.dart';
import 'package:smart_home_app/model/meal_model.dart';

class ConsuptionProvider with ChangeNotifier {
  final List<MealModel> _meals = [];
  List<MealModel> get meals {
    return [..._meals];
  }

  void addNewMeal(MealModel meal) {
    final newMeal = MealModel(
      title: meal.title,
      calories: meal.calories,
      amount: meal.amount,
    );
    _meals.add(newMeal);
    notifyListeners();
  }
}
