import 'package:flutter/material.dart';

class StopAndResetButton extends StatelessWidget {
  final Function() stopAndReset;

  const StopAndResetButton(this.stopAndReset, {super.key});

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
      child: InkWell(
        onTap: stopAndReset,
        child: Center(
          child: Icon(
            Icons.refresh_rounded,
            size: 32,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
