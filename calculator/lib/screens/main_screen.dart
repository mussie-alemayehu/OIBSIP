import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../evaluator.dart' as evaluator;
import '../functions/functions.dart' as functions;

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _inputController = TextEditingController();
  final _resultController = TextEditingController();
  bool _clearNext = false;

  @override
  void dispose() {
    super.dispose();
    _inputController.dispose();
    _resultController.dispose();
  }

  // this function will be triggered whenever a button is pressed
  void onPressed(String value) {
    if (value == 'AC') {
      // clear everything if 'AC' is pressed
      setState(() {
        _inputController.clear();
        _resultController.clear();
      });
    } else if (value == '⌫') {
      // delete a single value if '⌫' is pressed
      functions.deleteSingleValue(
        inputController: _inputController,
        resultController: _resultController,
      );
    } else if (value == '=') {
      // put the result in the input field and clear the result field
      _inputController.text = _resultController.text;
      _resultController.clear();
      _clearNext = true;
    } else {
      // clear the input field if the previous button was '='
      if (_clearNext) _inputController.clear();
      functions.insertValues(
        value: value,
        inputController: _inputController,
        resultController: _resultController,
      );
      _clearNext = false;
    }
    final exp = _inputController.text;
    final postfix = evaluator.convertToPostfix(exp);

    if (postfix.isNotEmpty && !_clearNext) {
      dynamic result = evaluator.evaluatePostfix(postfix);
      if (result == null) {
        _resultController.text = '';
      } else {
        // change result to String
        result = result.toString();

        // don't display the final 2 characters if the result ends with '.0'
        _resultController.text = (result as String).endsWith('.0')
            ? result.substring(0, result.length - 2)
            : result;
      }
    } else {
      _resultController.text = '';
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
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        // readOnly: true,
                        controller: _inputController,
                        style: TextStyle(
                          fontSize: 32,
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
                        textAlign: TextAlign.right,
                        controller: _resultController,
                        style: TextStyle(
                          fontSize: 20,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
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
