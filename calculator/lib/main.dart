import 'package:flutter/material.dart';

import './screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF0FF5F),
          secondary: Color(0xFF656D6E),
          tertiary: Color(0xFF222222),
          background: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
