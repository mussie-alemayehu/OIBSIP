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
      _deleteSingleValue();
      // // delete the last element if 'DEL' is pressed
      // if (_inputController.text.isNotEmpty) {
      //   final length = _inputController.text.length;
      //   _inputController.text = _inputController.text.substring(0, length - 1);
      // }
    } else if (value == '=') {
    } else {
      _insertValues(value);
    }

    if (_inputController.text.isNotEmpty) {
      final postfix = evaluator.convertToPostfix(_inputController.text);
      final result = evaluator.evaluatePostfix(postfix);
      _resultController.text = result.toString();
    } else {
      _resultController.text = '0';
    }
  }

  // this function will be used to add values to the input
  void _insertValues(String value) {
    // determine the position of the cursor
    final selection = _inputController.selection;
    if (selection.baseOffset == -1) {
      _inputController.text += value;
    } else {
      // determine the beginning and end of the text
      int base, extent;
      if (selection.baseOffset < selection.extentOffset) {
        base = selection.baseOffset;
        extent = selection.extentOffset;
      } else {
        extent = selection.baseOffset;
        base = selection.extentOffset;
      }

      // determine the text before the cursor
      final textBefore = _inputController.text.substring(0, base);

      // determine the text after the cursor
      final textAfter = _inputController.text.substring(extent);

      // set the complete text after the new value is added to the correct position
      _inputController.text = '$textBefore$value$textAfter';
    }
  }

  // this function will be used to delete a single character from the input
  void _deleteSingleValue() {
    // determine the position of the cursor
    final selection = _inputController.selection;
    if (selection.baseOffset == -1) {
      if (_inputController.text.isNotEmpty) {
        final length = _inputController.text.length;
        _inputController.text = _inputController.text.substring(0, length - 1);
      }
    } else {
      // determine the beginning and end of the text
      int base, extent;
      if (selection.baseOffset < selection.extentOffset) {
        base = selection.baseOffset;
        extent = selection.extentOffset;
      } else {
        extent = selection.baseOffset;
        base = selection.extentOffset;
      }
      if (base == extent && base > 0) base--;
      // determine the text before the cursor
      final textBefore = _inputController.text.substring(0, base);

      // determine the text after the cursor
      final textAfter = _inputController.text.substring(extent);

      // set the complete text after the new value is added to the correct position
      _inputController.text = '$textBefore$textAfter';
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
                        textAlign: TextAlign.right,
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
