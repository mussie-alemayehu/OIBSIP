class ExpressionStack {
  // this will hold the items in the stack
  final List<String> _stack = [];

  // define a getter for the stack
  List<String> get stack => _stack;

  // this function will be used to add items to the stack
  void push(String item) => _stack.add(item);

  // this function will be used to pop items from the stack
  String pop() => _stack.removeLast();

  // peek inside the stack
  String peek() => _stack.isNotEmpty ? _stack.last : '\0';

  // to check whether the stack is empty or not
  bool isEmpty() => _stack.isEmpty;
}

// define numbers and operators
const numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
const operators = ['-', '+', '*', '/'];

// to decide whether the first operator has greater precedence than the second one
bool isFirstGreater(String operator, String operator2) {
  if (operator == '\0') {
    return false;
  } else if ((operator == '-' || operator == '+') &&
      (operator2 == '*' || operator2 == '/')) {
    return false;
  } else {
    return true;
  }
}

bool isNumber(String value) {
  for (int i = 0; i < value.length; i++) {
    if (!numbers.contains(value[i])) {
      return false;
    }
  }
  return true;
}

List<String> convertToPostfix(String expression) {
  final stack = ExpressionStack();
  final postFix = <String>[];

  for (int i = 0; i < expression.length; i++) {
    var current = expression[i];

    // decide the number of digits in the operand
    while (i < expression.length - 1 &&
        !operators.contains(current) &&
        !operators.contains(expression[i + 1])) {
      current = '$current${expression[++i]}';
    }

    // if the current value is a number, add it to the stack
    if (isNumber(current)) {
      postFix.add(current);
    } else if ((current == '-' ||
        current == '+' ||
        current == '*' ||
        current == '/')) {
      // while the first operator has bigger precedence and the stack is not empty
      while (isFirstGreater(stack.peek(), current) && !stack.isEmpty()) {
        postFix.add(stack.pop());
      }
      stack.push(current);
    }
  }

  while (!stack.isEmpty()) {
    postFix.add(stack.pop());
  }

  return postFix;
}
