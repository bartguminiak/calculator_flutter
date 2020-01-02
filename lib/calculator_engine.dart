import 'calculator_scope.dart';

class CalculatorEngine {

  String output = _initialValue;

  nextValue(String value) {
    if (!supportedValues.contains(value))
      throw new ValueNotSupported();

    String result;

    if (value == '-' || value == '+' || value == '*') {
      _currentOperation = value;
    } else {
      switch (value) {
        case 'C': { _clear(); }
        break;

        case '=': {
          result = _calculateResult();
          _clear();
          _leftSide = result;
        }
        break;

        default: { _appendValue(value); }
        break;
      }
    }

    output = result ?? _rightSide ?? _leftSide ?? _initialValue;
  }

  String _leftSide;
  String _rightSide;
  String _currentOperation;
  static final _initialValue = '0';

  String _calculateResult() {
    final leftNumber = int.parse(_leftSide);
    final rightNumber = int.parse(_rightSide);

    switch (_currentOperation) {
      case '+': { return '${leftNumber + rightNumber}'; }
      break;

      case '-': { return '${leftNumber - rightNumber}'; }
      break;

      case '*': { return '${leftNumber * rightNumber}'; }
      break;

      default: { return 'Error'; }
    }
  }

  _clear() {
    _leftSide = null;
    _rightSide = null;
    _currentOperation = null;
    output = _initialValue;
  }

  _appendValue(String value) {
    if (_currentOperation == null) {
      if (_leftSide == null)
        _leftSide = value;
      else
        _leftSide = _cutDownFirstZeros(_leftSide += value);
    } else {
      if (_rightSide == null)
        _rightSide = value;
      else
        _rightSide = _cutDownFirstZeros(_rightSide += value);
    }
  }

  String _cutDownFirstZeros(String value) {
    while (value.startsWith(_initialValue) && value.length > 1) {
      value = value.substring(1);
    }
    return value;
  }

}
