import 'package:flutter/material.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {

  Keyboard({this.action});

  final void Function(String) action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Button('1', action),
              Button('4', action),
              Button('7', action),
              Button('C', action),
              Button('*', action)
            ]
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Button('2', action),
              Button('5', action),
              Button('8', action),
              Button('0', action),
              Button('-', action)
            ]
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Button('3', action),
              Button('6', action),
              Button('9', action),
              Button('+', action),
              Button('=', action)
            ]
        ),
      ],
    );
  }
}
