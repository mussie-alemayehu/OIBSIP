// this enum defines the buttons that will be available in the calculator
enum ButtonType {
  // the next four elements make up the first row of the buttons
  clear,
  divide,
  multiply,
  delete,
  // the second row
  seven,
  eight,
  nine,
  subtract,
  // the third row
  four,
  five,
  six,
  add,
  // the fourth row
  one,
  two,
  three,
  equals, // will span two rows
  // the fifth row
  zero, // will span two columns
  period,
}

const Map<ButtonType, String> buttonValue = {
  ButtonType.zero: '0',
  ButtonType.one: '1',
  ButtonType.two: '2',
  ButtonType.three: '3',
  ButtonType.four: '4',
  ButtonType.five: '5',
  ButtonType.six: '6',
  ButtonType.seven: '7',
  ButtonType.eight: '8',
  ButtonType.nine: '9',
  ButtonType.period: '.',
  ButtonType.delete: 'DEL',
  ButtonType.add: '+',
  ButtonType.subtract: '-',
  ButtonType.multiply: '*',
  ButtonType.divide: '/',
  ButtonType.equals: '=',
  ButtonType.clear: 'AC',
};
