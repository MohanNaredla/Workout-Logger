import 'package:flutter/material.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [];

  List<Workout> getWorkoutList() {
    return workoutList;
  }

  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercises: [], date: DateTime.now()));
    notifyListeners();
  }

  void addExercise(
    String workoutName,
    String exerciseName,
    String weight,
    String reps,
    String sets,
  ) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(
      Exercise(
        name: exerciseName,
        weight: weight,
        reps: reps,
        sets: sets,
      ),
    );
    notifyListeners();
  }

  Workout getRelevantWorkout(String name) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == name);
    return relevantWorkout;
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }

  int numberofExercisesinWorkout(String name) {
    Workout relevantWorkout = getRelevantWorkout(name);
    return relevantWorkout.exercises.length;
  }

  DateTime getDate(String name) {
    Workout relevantWorkout = getRelevantWorkout(name);
    return relevantWorkout.date;
  }

  void changeExerciseParameters(String weight, String reps, String sets,
      String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.weight = weight;
    relevantExercise.reps = reps;
    relevantExercise.sets = sets;
  }
}
