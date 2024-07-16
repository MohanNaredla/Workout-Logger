import 'package:workout/models/exercise.dart';

class Workout {
  Workout({
    required this.name,
    required this.exercises,
    required this.date,
  });
  final String name;
  final List<Exercise> exercises;
  final DateTime date;
}
