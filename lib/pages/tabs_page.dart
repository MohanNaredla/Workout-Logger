import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout/pages/charts_page.dart';
import 'package:workout/pages/settings_page.dart';
import 'package:workout/pages/workout_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() {
    return _TabsPage();
  }
}

class _TabsPage extends State<TabsPage> {
  int _index = 0;
  final pages = [
    const WorkoutPage(),
    const ChartsPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: Theme.of(context)
              .bottomNavigationBarTheme
              .selectedIconTheme!
              .copyWith(),
          unselectedIconTheme: Theme.of(context)
              .bottomNavigationBarTheme
              .unselectedIconTheme!
              .copyWith(),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_alt_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
