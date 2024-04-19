import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String option;
  const ChoiceItem(this.option, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 20,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Text(option),
    );
  }
}
