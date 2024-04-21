import 'package:flutter/material.dart';

import './screens/welcome_screen.dart';
import './screens/main_screen.dart';
import './screens/quiz_screen.dart';
import './screens/results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      // define the theme data of the app
      // this holds the styles to be used throughout the app
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6AD4DD),
          onPrimary: Color(0xFF7AA2E3),
          secondary: Color(0xFFF8F6E3),
          onSecondary: Color(0xFF6AD4DD),
          tertiary: Color(0xFF97E7E1),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      routes: {
        // this is where the screens in the app are registered
        QuizScreen.routeName: (_) => const QuizScreen(),
        MainScreen.routeName: (_) => const MainScreen(),
        ResultsScreen.routeName: (_) => const ResultsScreen(),
      },
    );
  }
}
