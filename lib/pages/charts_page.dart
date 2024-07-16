import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() {
    return _ChartsPage();
  }
}

class _ChartsPage extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 26,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 130.0, horizontal: 58.0),
        child: Column(
          children: [
            Text(
              "You can track your exercises here. This page provides detailed visual representation of your exercises and workouts",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.chart_bar_circle_fill),
              label: const Text("Track Exercise"),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Colors.black.withOpacity(0.8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
