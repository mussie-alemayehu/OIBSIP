import 'package:flutter/material.dart';

import './main_screen.dart';
import '../widgets/result_item.dart';
import '../models/question.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = '/result';

  const ResultsScreen({super.key});

  // a function that will be used to calculate the score achieved
  int _calculateScore({
    required List<String> answers,
    required List<Question> questions,
  }) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].answer == answers[i]) score++;
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    // extract arguments passed as route arguments
    final arguments = ModalRoute.of(context)!.settings.arguments!;
    final List<Question> questions = (arguments as Map)['questions'];
    final List<String> answers = arguments['userAnswers'];

    final score = _calculateScore(answers: answers, questions: questions);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text('Result: $score / ${questions.length}'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: questions.length,
              itemBuilder: (ctx, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ResultItem(
                  question: questions[index],
                  userAnswer: answers[index],
                ),
              ),
            ),
          ),
          // a finish button that will take the user to the main screen
          Positioned(
            bottom: 8,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(MainScreen.routeName),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Finish'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
