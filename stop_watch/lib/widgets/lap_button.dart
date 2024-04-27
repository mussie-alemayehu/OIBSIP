import 'package:flutter/material.dart';

class LapButton extends StatelessWidget {
  final void Function() lap;

  const LapButton(this.lap, {super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Tooltip(
      key: const ValueKey('lap'),
      message: 'Lap',
      child: Container(
        width: buttonHeight,
        height: buttonHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        ),
        child: InkWell(
          onTap: lap,
          child: Center(
            child: Text(
              'Lap',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
