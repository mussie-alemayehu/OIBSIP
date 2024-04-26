import 'package:flutter/material.dart';

class LapButton extends StatelessWidget {
  final void Function() loop;

  const LapButton(this.loop, {super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Tooltip(
      key: const ValueKey('loop'),
      message: 'Loop',
      child: Container(
        width: buttonHeight,
        height: buttonHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        ),
        child: InkWell(
          onTap: loop,
          child: Center(
            child: Icon(
              Icons.loop_rounded,
              size: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
