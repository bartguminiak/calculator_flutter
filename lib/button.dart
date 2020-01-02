import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;

  Button(this.label, this.action, {this.fontColor = Colors.grey, this.backgroundColor = Colors.white});

  final fontColor;
  final backgroundColor;

  final void Function(String) action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: FlatButton(
          color: backgroundColor,
          onPressed: () {
            action(label);
          },
          child: Text(
            label,
            style: TextStyle(
                color: fontColor,
                backgroundColor: backgroundColor
            ),
          )
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: backgroundColor),
    );
  }
}