import 'package:flutter/material.dart';

class EmptyWorkout extends StatelessWidget {
  const EmptyWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Welcome to FitHero!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w900,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 28.0),
            child: Text(
              "You have not logged any workout yet.\nStart by creating a new workout or try some of the premade workouts.",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    fontWeight: FontWeight.w900,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 28),
            child: Text(
              "\"Some people want it to happen, some wish it \nwould happen, others make it happen.\"",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 28),
            child: Text(
              "- Michael Jordan",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
