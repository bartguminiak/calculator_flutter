import 'package:flutter/material.dart';
import 'display.dart';
import 'keyboard.dart';
import 'display_content.dart';
import 'calculator_engine.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  _CalculatorState() {
    _displayContent.text = _calculatorEngine.output;
  }

  final _displayContent = DisplayContent();
  final _calculatorEngine = CalculatorEngine();

  _buttonAction(String value) {
    _updateDisplay(value);
  }

  _updateDisplay(String value) {
    _calculatorEngine.nextValue(value);
    setState(() {
      _displayContent.text = _calculatorEngine.output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Display(_displayContent)],
          ),
          Keyboard(action: (value) => _buttonAction(value))
        ],
      )
    );
  }
}