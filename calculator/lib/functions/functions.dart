import 'dart:math';

import 'package:flutter/material.dart';

// this function will be used to add values to the input
void insertValues({
  required String value,
  required TextEditingController inputController,
  required TextEditingController resultController,
}) {
  String textBefore;
  String textAfter;
  // determine the position of the cursor
  final selection = inputController.selection;
  if (selection.baseOffset == -1) {
    // if a position is not selected, use the entire input text as the text
    // before the input
    textBefore = inputController.text;
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
    textBefore = inputController.text.substring(0, base);

    // determine the text after the cursor
    textAfter = inputController.text.substring(extent);
  }

  // set the complete text after the new value is added to the correct position
  if (_isCharAllowedHere(
    char: value,
    textBefore: textBefore,
    textAfter: textAfter,
  )) inputController.text = '$textBefore$value$textAfter';
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
  } else if (char == '.') {
    // we are in this block to make sure not value provided has more than one dot(.)
    // we will achieve this by spliting the element where the value is to be
    // added and checking whether or not a dot already exists
    final operators = doublingNotAllowed.sublist(1);

    // initialize indices to hold the whole of the given input
    int textBeforeIndex = 0, textAfterIndex = textAfter.length;

    // this loop will determine the position of the last operator in textBefore
    // the given position and the position of the first operator in textAfter
    // we will then use these indices to split the element where the dot is to be added
    for (var operator in operators) {
      final newTextBeforeIndex = textBefore.lastIndexOf(operator);
      final newTextAfterIndex = textAfter.indexOf(operator);

      if (newTextAfterIndex == -1 && newTextBeforeIndex == -1) {
        // if this is the case, do nothing and keep the existing indices
      } else if (newTextAfterIndex == -1) {
        // update textBeforeIndex and keep the existing textAfterIndex
        textBeforeIndex = newTextBeforeIndex;
      } else if (newTextBeforeIndex == -1) {
        // update textAfterIndex and keep the esisting textBeforeIndex
        textAfterIndex = newTextAfterIndex;
      } else {
        // update both indices
        textBeforeIndex = max(textBeforeIndex, newTextBeforeIndex);
        textAfterIndex = min(textAfterIndex, newTextAfterIndex);
      }
    }

    // create the current element
    final currentElement = '${textBefore.substring(textBeforeIndex)}'
        '${textAfter.substring(0, textAfterIndex == textAfter.length ? null : textAfterIndex)}';

    if (currentElement.contains('.')) return false;
  }
  return true;
}

// this function will be used to delete a single character from the input
void deleteSingleValue({
  required TextEditingController inputController,
  required TextEditingController resultController,
}) {
  // determine the position of the cursor
  final selection = inputController.selection;
  if (selection.baseOffset == -1) {
    if (inputController.text.isNotEmpty) {
      final length = inputController.text.length;
      inputController.text = inputController.text.substring(0, length - 1);
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
    final textBefore = inputController.text.substring(0, base);

    // determine the text after the cursor
    final textAfter = inputController.text.substring(extent);

    // set the complete text after the new value is added to the correct position
    inputController.text = '$textBefore$textAfter';
  }
}
