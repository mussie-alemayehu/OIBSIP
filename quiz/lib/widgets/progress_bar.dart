import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progressWidth;
  const ProgressBar(this.progressWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    // we will show the progress using a stack of containers that have different
    // color
    return Stack(
      children: [
        // a background container which will have a width of the screen width
        Container(
          width: double.infinity,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        // a foreground container with a with a given width which is equal to
        // the progress of the quiz
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
