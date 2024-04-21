import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              color: Colors.white38,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              color: Colors.white10,
            ),
          ),
        ),
      ],
    );
  }
}
