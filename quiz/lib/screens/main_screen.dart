import 'package:flutter/material.dart';

import './quiz_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Quiz time',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Choose the amount of questions to start the quiz.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    // a row with two elements
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            // top-left container - 5 questions
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                QuizScreen.routeName,
                                arguments: 5,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                  ),
                                  color: Color(0xFF5F6F65),
                                ),
                                child: Center(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // top-right container - 10 questions
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                QuizScreen.routeName,
                                arguments: 10,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(32),
                                  ),
                                  color: Color(0xFF4F1787),
                                ),
                                child: Center(
                                  child: Text(
                                    '10',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // another row with two elements
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            // bottom-left container - 15 questions
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                QuizScreen.routeName,
                                arguments: 15,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: const Color(0xFFEF5A6F),
                                child: Center(
                                  child: Text(
                                    '15',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // bottom-right container - 20 questions
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                QuizScreen.routeName,
                                arguments: 20,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: const Color(0xFF597445),
                                child: Center(
                                  child: Text(
                                    '20',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
