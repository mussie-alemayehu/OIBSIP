import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../evaluator.dart' as evaluator;

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _inputController = TextEditingController();
  final _resultController = TextEditingController();

  // this function will be triggered whenever a button is pressed
  void onPressed(String value) {
    if (value == 'AC') {
      // clear everything if 'AC' is pressed
      setState(() {
        _inputController.clear();
        _resultController.clear();
      });
    } else if (value == 'DEL') {
      // delete the last element if 'DEL' is pressed
      if (_inputController.text.isNotEmpty) {
        final length = _inputController.text.length;
        _inputController.text = _inputController.text.substring(0, length - 1);
      }
    } else {
      _inputController.text += value;
    }

    if (_inputController.text.isNotEmpty) {
      final postfix = evaluator.convertToPostfix(_inputController.text);
      final result = evaluator.evaluatePostfix(postfix);
      _resultController.text = result.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // to hold the user input
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: _inputController,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // to hold the results of the user input
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: _resultController,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Buttons(onPressed),
            ),
          ),
        ],
      ),
    );
  }
}
