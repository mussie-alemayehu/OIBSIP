import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progressWidth;
  const ProgressBar(this.progressWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Container(
          width: progressWidth,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}
