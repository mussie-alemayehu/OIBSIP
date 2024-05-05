class _ExpressionStack {
  // this will hold the items in the stack
  final List<String> _stack = [];

  // define a getter for the stack
  List<String> get stack => _stack;

  // this function will be used to add items to the stack
  void push(String item) => _stack.add(item);

  // this function will be used to pop items from the stack
  String? pop() => _stack.isNotEmpty ? _stack.removeLast() : null;

  // peek inside the stack
  String? peek() => _stack.isNotEmpty ? _stack.last : null;

  // to check whether the stack is empty or not
  bool isEmpty() => _stack.isEmpty;
}

// define numbers and operators
const _numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
const _operators = ['-', '+', '*', '/'];

// to decide whether the first operator has greater precedence than the second one
bool _isFirstGreater(String operator, String operator2) {
  if (operator == '\0') {
    return false;
  } else if ((operator == '-' || operator == '+') &&
      (operator2 == '*' || operator2 == '/')) {
    return false;
  } else {
    return true;
  }
}

// to check whether a given expression is a number or not
bool _isNumber(String value) {
  for (int i = 0; i < value.length; i++) {
    if (!_numbers.contains(value[i])) {
      return false;
    }
  }
  return true;
}

List<String> convertToPostfix(String expression) {
  final stack = _ExpressionStack();
  final postFix = <String>[];

  try {
    for (int i = 0; i < expression.length; i++) {
      var current = expression[i];

      // decide the number of digits in the operand
      while (i < expression.length - 1 &&
          current != ' ' &&
          !_operators.contains(current) &&
          !_operators.contains(expression[i + 1])) {
        current = '$current${expression[++i]}';
      }

      // if the current value is a number, add it to the stack
      if (_isNumber(current)) {
        postFix.add(current);
      } else if (current == '-' ||
          current == '+' ||
          current == '*' ||
          current == '/') {
        // while the first operator has bigger precedence and the stack is not empty
        while (!stack.isEmpty() && _isFirstGreater(stack.peek()!, current)) {
          postFix.add(stack.pop()!);
        }
        stack.push(current);
      }
    }

    while (!stack.isEmpty()) {
      postFix.add(stack.pop()!);
    }

    return postFix;
  } catch (error) {
    // if there is an error while converting to postfix, return an empty list
    return [];
  }
}

double? evaluatePostfix(List<String> postfix) {
  final stack = _ExpressionStack();

  try {
    for (var exp in postfix) {
      if (_isNumber(exp)) {
        stack.push(exp);
      } else if (!stack.isEmpty() &&
          (exp == '-' || exp == '+' || exp == '*' || exp == '/')) {
        double operand1 = double.parse(stack.pop()!);
        double operand2 = double.parse(stack.pop()!);
        if (exp == '-') {
          stack.push('${operand2 - operand1}');
        } else if (exp == '+') {
          stack.push('${operand2 + operand1}');
        } else if (exp == '/') {
          stack.push('${operand2 / operand1}');
        } else if (exp == '*') {
          stack.push('${operand2 * operand1}');
        }
      } else {
        break;
      }
    }

    // at this point, the stack should have a single item which is the result
    // if the stack is empty at this point, there must be some error
    if (stack.isEmpty()) return 0;
    return double.parse(stack.pop()!);
  } catch (error) {
    // if there is an error while evaluating postfix, return null
    return null;
  }
}
