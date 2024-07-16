import 'package:flutter/material.dart';

class EmptyExercise extends StatelessWidget {
  const EmptyExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 240.0, horizontal: 58.0),
            child: Text(
              "You have not logged any exercise yet.\nStart by creating a new exercise or try some of the premade workouts.",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    fontWeight: FontWeight.w900,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
