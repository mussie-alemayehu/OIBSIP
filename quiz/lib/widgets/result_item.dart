import 'package:flutter/material.dart';

import '../models/question.dart';
import './result_choice_item.dart';

class ResultItem extends StatelessWidget {
  final Question question;
  final String userAnswer;

  const ResultItem({
    super.key,
    required this.question,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // to display a green or red flag based on the correctness of the
        // answer provided
        Expanded(
          child: Center(
            child: question.answer == userAnswer
                ? const Icon(Icons.check_circle, color: Colors.green)
                : const Icon(Icons.cancel, color: Colors.red),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            // to display a review of the question and the provided answer
            // will display the correct answers as well
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              color: Colors.white10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...question.options
                        .map<Widget>(
                          (option) => ResultChoiceItem(
                            option: option,
                            answer: question.answer,
                            userAnswer: userAnswer,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
