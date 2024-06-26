import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  final void Function() stop;

  const StopButton(this.stop, {super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Tooltip(
      key: const ValueKey('stop'),
      message: 'Stop',
      child: InkWell(
        onTap: stop,
        child: Container(
          width: buttonHeight,
          height: buttonHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          ),
          child: Center(
            child: Container(
              height: buttonHeight * 0.6,
              width: buttonHeight * 0.6,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
