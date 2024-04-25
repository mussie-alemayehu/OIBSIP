import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Container(
      width: buttonHeight,
      height: buttonHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: Center(
        child: Text(
          'Start',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
