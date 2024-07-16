import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workout/components/empty_workout.dart';
import 'package:workout/components/workout_tile.dart';
import 'package:workout/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() {
    return _WorkoutPage();
  }
}

class _WorkoutPage extends State<WorkoutPage> {
  final workoutNameController = TextEditingController();
  final todayDate = DateFormat.MMMMd().format(DateTime.now());

  void createWorkout() {
    showCupertinoDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: Theme.of(context).dialogTheme.titleTextStyle!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
        surfaceTintColor: Theme.of(context).dialogTheme.surfaceTintColor,
        title: const Text(
          "Create New Workout",
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                ),
                controller: workoutNameController,
              ),
            ],
          ),
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

  void save() {
    Provider.of<WorkoutData>(context, listen: false)
        .addWorkout(workoutNameController.text);
    Navigator.pop(context);
    workoutNameController.clear();
  }

  void cancel() {
    Navigator.pop(context);
    workoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              child: const Icon(Icons.calendar_month_rounded),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createWorkout,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: const CircleBorder(
            eccentricity: 0,
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Workout",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 4,
                  ),
                  child: Text(
                    "Today, $todayDate",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black54.withOpacity(0.7),
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              if (value.getWorkoutList().isNotEmpty)
                const WorkoutTile()
              else
                const EmptyWorkout(),
            ],
          ),
        ),
      ),
    );
  }
}
