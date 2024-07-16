import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/data/workout_data.dart';
import 'package:workout/pages/exercise_page.dart';

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    void goToWorkoutPage(String workoutName) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ExercisePage(
            workoutName: workoutName,
          ),
        ),
      );
    }

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 7.0,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: value.getWorkoutList().length,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  enableFeedback: true,
                  titleTextStyle:
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                  contentPadding: const EdgeInsets.all(20),
                  tileColor: const Color.fromARGB(255, 23, 22, 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  iconColor: Colors.white,
                  title: Text(
                    value.getWorkoutList()[index].name.toUpperCase(),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                  onTap: () =>
                      goToWorkoutPage(value.getWorkoutList()[index].name),
                ),
                const Divider(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
