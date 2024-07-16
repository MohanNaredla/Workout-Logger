import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workout/data/workout_data.dart';
import 'package:workout/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 229, 225, 225),
          ),
          textTheme: GoogleFonts.latoTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: const Size(330, 70),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 8,
            unselectedIconTheme: IconThemeData(
              size: 22,
              fill: 0.5,
              weight: 0.6,
              color: Colors.grey,
            ),
            selectedIconTheme: IconThemeData(
              size: 20,
              fill: 1,
              weight: 1.5,
              color: Colors.black,
            ),
          ),
          dialogTheme: DialogTheme(
            surfaceTintColor: Colors.black,
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
