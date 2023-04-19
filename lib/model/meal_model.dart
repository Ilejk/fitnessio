class MealModel {
  String id;
  String title;
  double calories;
  double amount;
  double proteins;
  double fats;
  double carbs;
  DateTime dateTime;
  MealModel({
    required this.id,
    required this.title,
    required this.calories,
    required this.amount,
    required this.carbs,
    required this.fats,
    required this.proteins,
    required this.dateTime,
  });
}
