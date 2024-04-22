import 'package:flutter/material.dart';
import 'package:quiz/screens/results_screen.dart';

import '../data.dart' as data;
import '../models/question.dart';
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

  // will be used to hold the list of questions from our data file
  late final List<Question> quiz;

  // create variables to hold current question index and selected answer if
  // there is any
  int currentQuiz = 0;
  late List<String?> selectedAnswers;

  // a variable to store the width of the screen
  late final double _screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _screenWidth = MediaQuery.of(context).size.width;
      _isInit = false;

      final numberOfQns = ModalRoute.of(context)!.settings.arguments! as int;

      // initialize the quiz and the list to hold the selected answers based on
      // the number of questions selected by the user
      switch (numberOfQns) {
        case 5:
          {
            quiz = data.questions5
                .map<Question>(
                  (question) => Question(
                    answer: question['answer'] as String,
                    options: (question['options'] as List)
                        .map<String>((value) => value as String)
                        .toList(),
                    question: question['question'] as String,
                  ),
                )
                .toList();

            selectedAnswers = List.generate(
              5,
              (index) => null,
              growable: false,
            );
            break;
          }

        case 10:
          {
            quiz = data.questions10
                .map<Question>(
                  (question) => Question(
                    answer: question['answer'] as String,
                    options: (question['options'] as List)
                        .map<String>((value) => value as String)
                        .toList(),
                    question: question['question'] as String,
                  ),
                )
                .toList();

            selectedAnswers = List.generate(
              10,
              (index) => null,
              growable: false,
            );
            break;
          }

        case 15:
          {
            quiz = data.questions15
                .map<Question>(
                  (question) => Question(
                    answer: question['answer'] as String,
                    options: (question['options'] as List)
                        .map<String>((value) => value as String)
                        .toList(),
                    question: question['question'] as String,
                  ),
                )
                .toList();

            selectedAnswers = List.generate(
              15,
              (index) => null,
              growable: false,
            );
            break;
          }

        case 20:
          {
            quiz = data.questions20
                .map<Question>(
                  (question) => Question(
                    answer: question['answer'] as String,
                    options: (question['options'] as List)
                        .map<String>((value) => value as String)
                        .toList(),
                    question: question['question'] as String,
                  ),
                )
                .toList();

            selectedAnswers = List.generate(
              20,
              (index) => null,
              growable: false,
            );
            break;
          }
      }
    }
  }

  // a function that will define what the next button will do
  void _nextQuestion() {
    if (selectedAnswers[currentQuiz] != null) {
      if (currentQuiz < quiz.length - 1) {
        setState(() => currentQuiz++);
      } else {
        // show the results....
      }
    } else {
      showAnswerNotSelectedError();
    }
  }

  // a function that will define what the previous button will do
  void _previousQuestion() {
    setState(() => currentQuiz--);
  }

  // a function that will be used to show the results of the quiz
  void _showResults() => Navigator.of(context).pushNamed(
        ResultsScreen.routeName,
        arguments: {
          'questions': quiz,
          'userAnswers':
              selectedAnswers.map<String>((value) => value!).toList(),
        },
      );

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
                quiz[currentQuiz].question,
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
                children: quiz[currentQuiz]
                    .options
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
            ),
            // the coming widget will hold the navigation elements next and
            // previous question
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  // this is the previous button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: currentQuiz == 0 ? null : _previousQuestion,
                      child: const FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.skip_previous_rounded),
                            Text('Prev'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // here comes the next button
                  Expanded(
                    flex: 3,
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
                        currentQuiz == quiz.length - 1
                            ? _showResults()
                            : _nextQuestion();
                      },
                    ),
                  ),
                ],
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
