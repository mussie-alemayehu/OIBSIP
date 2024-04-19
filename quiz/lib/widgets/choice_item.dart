import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String option;
  final String? selected;

  const ChoiceItem({
    super.key,
    required this.option,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              option,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Radio(
              groupValue: selected,
              value: option,
              onChanged: (_) {},
              fillColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
