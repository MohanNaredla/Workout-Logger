import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/components/exercise_modal.dart';
import 'package:workout/components/exercise_tile.dart';
import 'package:workout/data/workout_data.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({
    super.key,
    required this.workoutName,
  });

  final String workoutName;

  @override
  State<ExercisePage> createState() {
    return _ExercisePage();
  }
}

class _ExercisePage extends State<ExercisePage> {
  void createExercise() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ExerciseModalSheet(workoutName: widget.workoutName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.workoutName.toUpperCase(),
          ),
        ),
        body: ListView.builder(
          itemCount: value.numberofExercisesinWorkout(widget.workoutName),
          itemBuilder: (context, index) => ExerciseTile(
            name: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .name,
            weight: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .weight,
            reps: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .reps,
            sets: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .sets,
            workoutName: widget.workoutName,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createExercise,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: const CircleBorder(
            eccentricity: 0,
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
