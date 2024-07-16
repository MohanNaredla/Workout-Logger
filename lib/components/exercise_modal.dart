import 'package:flutter/material.dart';
import 'package:workout/data/workout_data.dart';
import 'package:provider/provider.dart';

class ExerciseModalSheet extends StatelessWidget {
  const ExerciseModalSheet({super.key, required this.workoutName});

  final String workoutName;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final weightController = TextEditingController();
    final repsController = TextEditingController();
    final setsController = TextEditingController();

    void clear() {
      nameController.clear();
      weightController.clear();
      repsController.clear();
      setsController.clear();
    }

    void save() {
      Provider.of<WorkoutData>(context, listen: false).addExercise(
        workoutName,
        nameController.text,
        weightController.text,
        repsController.text,
        setsController.text,
      );
      Navigator.pop(context);
      clear();
    }

    void cancel() {
      Navigator.pop(context);
      clear();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Name",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Weight",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ),
            controller: weightController,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Reps",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ),
            controller: repsController,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Sets",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ),
            controller: setsController,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  elevation: 6,
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: save,
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: 12,
                ),
                MaterialButton(
                  elevation: 6,
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
