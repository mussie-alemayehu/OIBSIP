import 'package:flutter/material.dart';

import '../data.dart' as data;
import '../widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _isInit = true;

  // get a list of questions from our data file
  final quiz = data.questions;

  // create variables to hold current question index and selected answer if
  // there is any
  int currentQuiz = 0;
  int? selectedAnswer;

  // a variable to store the width of the screen
  late final double _screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _screenWidth = MediaQuery.of(context).size.width;
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    // calculate the progress of the user as a ratio
    final progress = currentQuiz / quiz.length;

    // use the determined ratio to determine the width of the progress indicator
    final progressWidth = _screenWidth * progress;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 12),
          child: ProgressBar(progressWidth),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // will be used to display progress through a given quiz
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Question $currentQuiz of ${quiz.length}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                onPressed: () {
                  setState(() {
                    if (currentQuiz < quiz.length) currentQuiz++;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
