import 'package:alt_idea/screens/new_idea_screen.dart';
import 'package:alt_idea/screens/notification_screen.dart';
import 'package:alt_idea/screens/profile_screen.dart';

import 'home_screen.dart';
import 'settings_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _currentScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {"page": HomeScreen()},
      {"page": SettingsScreen()},
      {"page": NewIdeaScreen()},
      {"page": NotificationScreen()},
      {"page": ProfileScreen()},
    ];
  }

  Icon changeIcon(int index) {
    if (index == _currentScreenIndex) {
      switch (index) {
        case 0:
          return Icon(Icons.home_filled);
          break;
        case 1:
          return Icon(Icons.settings);
          break;
        case 2:
          return Icon(Icons.add_circle);
          break;
        case 3:
          return Icon(Icons.add_alert_rounded);
          break;
        case 4:
          return Icon(Icons.account_circle);
          break;
      }
    } else {
      switch (index) {
        case 0:
          return Icon(Icons.home_outlined);
          break;
        case 1:
          return Icon(Icons.settings_outlined);
          break;
        case 2:
          return Icon(Icons.add_circle_outline);
          break;
        case 3:
          return Icon(Icons.add_alert_outlined);
          break;
        case 4:
          return Icon(Icons.account_circle_outlined);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentScreenIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _currentScreenIndex,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 30),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(icon: changeIcon(0), label: ""),
          BottomNavigationBarItem(icon: changeIcon(1), label: ""),
          BottomNavigationBarItem(icon: changeIcon(2), label: ""),
          BottomNavigationBarItem(icon: changeIcon(3), label: ""),
          BottomNavigationBarItem(icon: changeIcon(4), label: "")
        ],
      ),
    );
  }
}
