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
      _deleteSingleValue();
    } else if (value == '=') {
      // put the result in the input field and clear the result field
      _inputController.text = _resultController.text;
      _resultController.clear();
      _clearNext = true;
    } else {
      // clear the input field if the previous button was '='
      if (_clearNext) _inputController.clear();
      _insertValues(value);
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

  // this function will be used to add values to the input
  void _insertValues(String value) {
    String textBefore;
    String textAfter;
    // determine the position of the cursor
    final selection = _inputController.selection;
    if (selection.baseOffset == -1) {
      // if a position is not selected, use the entire input text as the text
      // before the input
      textBefore = _inputController.text;
      textAfter = '';
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
      textBefore = _inputController.text.substring(0, base);

      // determine the text after the cursor
      textAfter = _inputController.text.substring(extent);
    }

    // set the complete text after the new value is added to the correct position
    if (_isCharAllowedHere(
      char: value,
      textBefore: textBefore,
      textAfter: textAfter,
    )) _inputController.text = '$textBefore$value$textAfter';
  }

  // to check whether the given input character is allowed in the given position
  bool _isCharAllowedHere({
    required String char,
    required String textBefore,
    String textAfter = '',
  }) {
    const doublingNotAllowed = ['.', '+', '-', '*', '/'];
    // if the given character is among the items in the given list and if the
    // text before the given position ends or the text after the given position
    // starts with one of the values given above, we cannot add the given character
    if (doublingNotAllowed.contains(char) &&
        (doublingNotAllowed.contains(
              textBefore.substring(textBefore.length - 1),
            ) ||
            (textAfter.isNotEmpty &&
                doublingNotAllowed.contains(
                  textAfter.substring(0, 1),
                )))) {
      return false;
    }
    // print()
    // print(textBefore.substring(textBefore.length - 1));
    // print(textAfter.substring(textAfter.length - 1));
    return true;
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
