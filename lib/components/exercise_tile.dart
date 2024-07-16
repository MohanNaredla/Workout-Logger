import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/data/workout_data.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile(
      {super.key,
      required this.name,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.workoutName});

  final String name;
  final String weight;
  final String reps;
  final String sets;
  final String workoutName;

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController();
    final repsController = TextEditingController();
    final setsController = TextEditingController();

    void clear() {
      weightController.clear();
      repsController.clear();
      setsController.clear();
    }

    void save() {
      Provider.of<WorkoutData>(context, listen: false)
          .changeExerciseParameters(weight, reps, sets, workoutName, name);
      Navigator.pop(context);
      clear();
    }

    void cancel() {
      Navigator.pop(context);
      clear();
    }

    void showParameters() {
      showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
          titleTextStyle:
              Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
          surfaceTintColor: Theme.of(context).dialogTheme.surfaceTintColor,
          title: const Text("Edit Parameters"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
          actions: [
            MaterialButton(
              elevation: 6,
              color: Colors.black,
              textColor: Colors.white,
              onPressed: save,
              child: const Text("Save"),
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
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          onTap: showParameters,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          enableFeedback: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          minVerticalPadding: 7,
          titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
          tileColor: const Color.fromARGB(255, 23, 22, 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          iconColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              name.toUpperCase(),
            ),
          ),
          subtitle: Row(
            children: [
              Chip(
                shape: const StadiumBorder(),
                label: Text(
                  '$weight kg',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                backgroundColor: Colors.grey,
                elevation: 3,
              ),
              const SizedBox(
                width: 8,
              ),
              Chip(
                shape: const StadiumBorder(),
                label: Text(
                  '$reps reps',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                backgroundColor: Colors.grey,
                elevation: 3,
              ),
              const SizedBox(
                width: 8,
              ),
              Chip(
                shape: const StadiumBorder(),
                label: Text(
                  '$sets sets',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                backgroundColor: Colors.grey,
                elevation: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
