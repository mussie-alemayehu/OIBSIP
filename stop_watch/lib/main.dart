import 'package:flutter/material.dart';
import 'package:stop_watch/screens/stopwatch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1A4D2E),
          secondary: Color(0xFF9AC8CD),
          tertiary: Color(0xFFE1F7F5),
        ),
        useMaterial3: true,
      ),
      home: const StopwatchScreen(),
    );
  }
}
