import 'package:flutter/material.dart';

class currentInputStream extends StatelessWidget { // this will show what the expression the user wants to do
  final String outputStream; // takes the current commands from the main app

  currentInputStream(this.outputStream);

  @override
  Widget build(BuildContext context) {
    return Row( // another row
      mainAxisAlignment: MainAxisAlignment.end,  // puts it at the end of the screen
      children: <Widget>[
      Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          this.outputStream,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    ]);
  }
}
