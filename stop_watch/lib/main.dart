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
      title: 'Stop Watch',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StopwatchScreen(),
    );
  }
}
