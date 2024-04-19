import 'package:flutter/material.dart';

import './choice_item.dart';

class ChoiceViewer extends StatefulWidget {
  final List<String> options;
  final String answer;

  const ChoiceViewer(this.options, this.answer, {super.key});

  @override
  State<ChoiceViewer> createState() => _ChoiceViewerState();
}

class _ChoiceViewerState extends State<ChoiceViewer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChoiceItem(widget.options[0]),
        ChoiceItem(widget.options[1]),
        ChoiceItem(widget.options[2]),
        ChoiceItem(widget.options[3]),
      ],
    );
  }
}
