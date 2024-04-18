import 'package:flutter/material.dart';

import '../data.dart' as data;

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // get a list of questions from our data file
  final quiz = data.questions;

  // create variables to hold current question index and selected answer if
  // there is any
  int currentQuiz = 0;
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Padding(
              // will be used to display progress through a given quiz
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Placeholder(),
            ),
            const Expanded(
              // will be used to display the question
              flex: 2,
              child: Placeholder(),
            ),
            const Expanded(
              // will be used to display choices
              flex: 2,
              child: Placeholder(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Next'),
                    Icon(Icons.skip_next_rounded),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
