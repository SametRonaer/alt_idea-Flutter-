import 'screens/auth_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'constants/app_theme.dart' as altIdeaTheme;

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: altIdeaTheme.appTheme,
      home: SafeArea(child: AuthScreen()),
      //theme: altIdeaTheme,
    );
  }
}
