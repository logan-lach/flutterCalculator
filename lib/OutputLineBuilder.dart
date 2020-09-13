import 'package:flutter/material.dart';

class OutputLineBuilder extends StatelessWidget { // shows the total
  double output;
  int textSize = 60;

  OutputLineBuilder(double output) {
    this.output = output;
  }

  @override
  Widget build(BuildContext context) {
    return Row( // another row
      mainAxisAlignment: MainAxisAlignment.end, //put at the end of the screen
      children: <Widget>[
          Container(
            alignment: Alignment.centerRight, // dont know why i do this, doesnt really do anything
            padding: EdgeInsets.all(0.0),
            child: Text(
              this.output.toString(),
              style: TextStyle(fontSize: 60.0),
            ),
          ),
      ],
    );
  }
}
