class WorkoutModel {
  final String id;
  final String name;
  final int setNumber;
  final int repNumber;
  final DateTime dateTime;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.repNumber,
    required this.setNumber,
    required this.dateTime,
  });
}
