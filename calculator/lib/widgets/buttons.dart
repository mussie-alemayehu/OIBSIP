import 'dart:math';

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // use the minimum of the fourth of the screen width or height or 80 as the
    // radius of the button
    final buttonRadius =
        min(min((width - 24) / 4, (height - 12) / 4), 80).toDouble();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisExtent: buttonRadius,
        mainAxisSpacing: 12,
      ),
      itemCount: 16,
      itemBuilder: (ctx, index) => Container(
        width: buttonRadius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            shape: const CircleBorder(),
          ),
          child: const Text('7'),
          onPressed: () {},
        ),
      ),
    );
  }
}
