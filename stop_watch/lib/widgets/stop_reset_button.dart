import 'package:flutter/material.dart';

class StopAndResetButton extends StatelessWidget {
  const StopAndResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 60.0;

    return Container(
      width: buttonHeight,
      height: buttonHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2),
      ),
      child: const Center(
        child: Icon(Icons.refresh_rounded, size: 32),
      ),
    );
  }
}
