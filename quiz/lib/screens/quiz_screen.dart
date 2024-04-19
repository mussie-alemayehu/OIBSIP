import 'package:flutter/material.dart';

import '../data.dart' as data;
import '../widgets/progress_bar.dart';
import '../widgets/choice_item.dart';

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
  List<String?> selectedAnswers = List.generate(
    10,
    (index) => null,
    growable: false,
  );

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
    final progress = (currentQuiz + 1) / quiz.length;

    // use the determined ratio to determine the width of the progress indicator
    final progressWidth = _screenWidth * progress;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
                'Question ${currentQuiz + 1} of ${quiz.length}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              // will be used to display the question
              child: Text(
                quiz[currentQuiz]['question'] as String,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              // will be used to display choices
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: (quiz[currentQuiz]['options'] as List)
                    .map(
                      (option) => InkWell(
                        child: ChoiceItem(
                          option: option,
                          selected: selectedAnswers[currentQuiz],
                        ),
                        onTap: () {
                          setState(() => selectedAnswers[currentQuiz] = option);
                        },
                      ),
                    )
                    .toList(),
              ),
              // ChoiceViewer(quiz[currentQuiz]['options'] as List<String>,
              //     quiz[currentQuiz]['answer'] as String),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (currentQuiz < quiz.length - 1) const Text('Next'),
                    if (currentQuiz < quiz.length - 1)
                      const Icon(Icons.skip_next_rounded),
                    if (currentQuiz == quiz.length - 1)
                      const Text('Show results')
                  ],
                ),
                onPressed: () {
                  if (selectedAnswers[currentQuiz] != null) {
                    if (currentQuiz < quiz.length - 1) {
                      setState(() => currentQuiz++);
                    } else {
                      // show the results....
                    }
                  } else {
                    showAnswerNotSelectedError();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // will be invoked when the user tries to proceed without choosing an answer
  void showAnswerNotSelectedError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Center(
          child: Text('Choose an answer first.'),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
