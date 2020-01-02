import 'package:flutter/material.dart';
import 'display_content.dart';

class Display extends StatefulWidget {

  final DisplayContent displayContent;
  Display(this.displayContent);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  @override
  Widget build(BuildContext context) {
    return Text(
        widget.displayContent.text,
        textAlign: TextAlign.right,
        style: TextStyle(
            color: Colors.grey,
            backgroundColor: Colors.white,
            decoration: TextDecoration.none)
      );
  }

}
