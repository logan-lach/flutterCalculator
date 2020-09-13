import 'package:flutter/material.dart';

class buttonBarCustom extends StatelessWidget {
  final Function changeOutput;
  final Function changeCurrentInput;

  buttonBarCustom(this.changeOutput, this.changeCurrentInput);


// USELESS METHOD WAS USING IT TO LEARN HOW THE BUTTONS WOULD WORK, DELETE WHEN YOU CAN

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  this.changeCurrentInput('5.0 +');
                }),
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  this.changeCurrentInput('- 5.0');
                }),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: null,
            )
          ],
    );
  }
}
