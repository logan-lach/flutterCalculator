import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final Function changeOutput; // this changes the top most bar, shows the total
  final Function changeInput; // this changes all the commands
  final Function clearAll; // this clears the output and commands rows
  final Function clearCommands; // this clears the commands
  final Function makeNegative;
  final Function makePercentage;

  CalculatorButtons(this.changeOutput, this.changeInput, this.clearAll, this.clearCommands, this.makeNegative, this.makePercentage);

  @override
  Widget build(BuildContext context) {
    var column1 = ['C', 7, 4, 1,0];
    var column2 = ['R', 8, 5, 2,'']; // these are the button layouts
    var column3 = ['%', 9, 6, 3,'.'];
    var column4 = ['/','*', '+', '-', '='];

    return Row( // the entire set of  buttons will be conained in this row
      children: [
      

        Expanded( 
          child: Column( // putting it into a column so it fills out
            mainAxisAlignment: MainAxisAlignment.start, // spread the buttons out even
            crossAxisAlignment: CrossAxisAlignment.stretch, // make it stretch to the end
            children: [
              ...buttonColumn(column1), // all buttons created for column 1, the clear key, 7,4,and 1 buttons
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // the pattern continues downward in each of their respective arrays
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...buttonColumn(column2),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              ...buttonColumn(column3),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...buttonColumn(column4),
            ],
          ),
        ),
      ],
    );
  }


  void onPressedEquals(){
    changeOutput();
    clearCommands();
  }

  List<Widget> buttonColumn(List column) { // gross long method, lots of code reuse because it has to use certain methods
    List<Widget> returner = [];
    for (int i = 0; i < column.length; i++) { // goes through the entire column that i pass
      if (column[i] is String) { // if its a string (meaning if it isnt a number)
        switch (column[i]){
          case '=':
            returner.add(makeButtons(onPressedEquals, column[i]));
            break;
          case 'C':
            returner.add(makeButtons(clearAll, column[i]));
            break;
          case '%':
            returner.add(makeButtons(makePercentage,column[i]));
            break;
          case 'R':
            returner.add(makeButtons(makeNegative, column[i]));
            break;
          default:
          returner.add(
            Expanded(
            child: FlatButton(
              color: Colors.grey[750],
              onPressed: () => changeInput(column[i]), // i dont know bc i havent got around to it yet, 
              child: Text(
                column[i].toString(),
                style: TextStyle(fontSize: 40),
              ),
              textTheme: ButtonTextTheme.primary,
            ),
          )
          );
          break;
        }
/*
        if (column[i] == '=') { // if its a equals sign 
          returner.add(
            makeButtons(onPressedEquals, column[i])
            // ik why it works, when you pass a method, you want a reference to the method
           // but when you want to execute the function with onpressed, you dont want a reference,
            // you want that code snipet to execute
          );
          continue;
        }
        if(column[i] == 'C'){ // if its the clear key
          returner.add(
            makeButtons(clearAll, column[i])
          );
          continue;
        }

        if(column[i] == '%'){

        }
        returner.add( // but if it is any other symbol
          Expanded(
            child: FlatButton(
              color: Colors.grey[750],
              onPressed: () => changeInput(column[i]), // i dont know bc i havent got around to it yet, 
              child: Text(
                column[i].toString(),
                style: TextStyle(fontSize: 40),
              ),
              textTheme: ButtonTextTheme.primary,
            ),
          ),
        );
        */
      } 
      else // if its a number
        (returner.add(
          Expanded(

            child: FlatButton(
              color: Colors.grey[750],
              onPressed: () => changeInput(column[i].toString()), // make the double a string and add it to the input
              child: Text(
                column[i].toString(),
                style: TextStyle(fontSize: 40),
              ),
              textTheme: ButtonTextTheme.primary,
            ),
          ),
        ));
    }
    return returner; // return the list of Widgets (FlatButtons) on completion
  }

  Widget makeButtons(Function method, var item){
    return Expanded(
              child: FlatButton(
                color: Colors.grey[750],
                onPressed: () => method(), // unsure as to why this is, but it works, so do not touch it
                
                child: Text(
                  item.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                textTheme: ButtonTextTheme.primary,
              ),
            );
  }
}
