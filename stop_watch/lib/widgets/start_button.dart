import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final void Function() start;

  const StartButton(this.start, {super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Tooltip(
      key: const ValueKey('start'),
      message: 'Start',
      child: InkWell(
        onTap: start,
        child: Container(
          width: buttonHeight,
          height: buttonHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          ),
          child: Center(
            child: Text(
              'Start',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
