class ExpressionStack {
  // this will hold the items in the stack
  final List<String> _stack = [];

  // define a getter for the stack
  List<String> get stack => _stack;

  // this function will be used to add items to the stack
  void push(String item) => _stack.add(item);

  // this function will be used to pop items from the stack
  String pop() => _stack.removeLast();

  // to check whether the stack is empty or not
  bool isEmpty() => _stack.isEmpty;
}
