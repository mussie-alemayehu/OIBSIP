import 'package:flutter/material.dart';

class ResultChoiceItem extends StatelessWidget {
  final String option;
  final String answer;
  final String userAnswer;

  const ResultChoiceItem({
    super.key,
    required this.option,
    required this.answer,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: option == answer
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.check_circle, color: Colors.green),
              ],
            )
          : option == userAnswer
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.cancel, color: Colors.red),
                  ],
                )
              : Text(
                  option,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
    );
  }
}
