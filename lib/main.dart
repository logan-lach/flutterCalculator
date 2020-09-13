import 'package:flutter/material.dart';
import 'package:workout_app/CalculatorButtons.dart';
import 'package:workout_app/currentInputStream.dart';
import 'OutputLineBuilder.dart';
import 'buttonBarCustom.dart';
import 'currentInputStream.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Simple Calculator'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double output = 0;
  String currentCommands = '';

  void increaseOutput() {
    // increase output does just that
    List<String> temp = processOutput(currentCommands);
    double returner = processResult(temp);
    setState(() {
      this.output = returner;
    });
  }

  void clearAll() {
    // clears the whole screen
    setState(() {
      this.currentCommands = '';
      this.output = 0;
    });
  }

  void makeNegative() {
    setState(() {
      // buggy with how this works, but it should fufill its purpose
      this.output *= -1;
    });
  }

  void takePercentage() {
    setState(() {
      this.output *= .1;
    });
  }

  void clearCommands() {
    // changes the state so the current commands are none
    setState(() {
      this.currentCommands = '';
    });
  }

  void changeCurrentCommands(String command) {
    // changes what is going on
    setState(() {
      this.currentCommands += command;
    });
  }

  List<String> processOutput(String input) {
    List<String> array = [];
    String temp = '';

    for (int i = 0; i < input.length; i++) {
      if ((input.codeUnitAt(i) ^ 0x30) <= 9 || input[i] == '.') {
        // if its a number
        temp += input[
            i]; // add it to the temporary holder, this is because we want it to be a whole number not parts
      } else {
        if (i == 0) {
          array.add(this
              .output
              .toString()); // if it starts off with a sign, use the previous output
          array.add(input[i]);
          temp = '';
        } else {
          array.add(temp); // else add the sign to the new array
          array.add(input[i]); // add the total number to the array
          temp = ''; // reset temp
        }
      }
    }
    array.add(temp); // incase it ends with a number, put it in
    return array;
  }

  double processResult(List<String> input) {
    // takes the list of strings and goes by appropriate method
    // takes a list of strings from the previous method
    double total = this.output;
    double current = 0; // dont know why this is here, bump it soon
    double previous = 0;
    for (int i = 0; i < input.length; i++) {
      // for the length of the list
      switch (input[i]) {
        case ('+'): // if its a plus sign
          {
            total = previous +
                double.parse(input[i +
                    1]); // lots of cheating going on here, assuming user doesn't put a operator at the end of the statement
            current =
                0; // defintley a better way of doing it, but its midnight on a friday and im tired so ill fix it later
            previous = total;
            break;
          }
        case ('-'):
          {
            total = previous -
                double.parse(input[i +
                    1]); // parses the next one to the double and subrtracts that from the previous expression
            current = 0;
            previous = total;
            break;
          }
        case ('*'):
          {
            total = previous * double.parse(input[i + 1]);
            current = 0;
            previous = total;
            break;
          }
        case ('/'):
          {
            total = previous / double.parse(input[i + 1]);
            current = 0;
            previous = total;
            break;
          }
        default:
          {
            if (previous == 0) {
              // if the first one is a number(which i know it will be because if its not a number its the previous total)
              previous = double.parse(input[i]);
            } else // dump this once i find out if its important
              current = double.parse(input[i]);
          }
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // this is the big one, the main setup
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: OutputLineBuilder(this.output), // this is the total displayer
        ),
        Expanded(
          flex: 2,
          child: currentInputStream(
              this.currentCommands), // this is whats going on rn
        ),
        Expanded(
          flex: 5,
          child: CalculatorButtons(
              // this is what changes everything on the screen, its the buttons
              increaseOutput,
              changeCurrentCommands,
              clearAll,
              clearCommands,
              makeNegative,
              takePercentage),
        ),
      ],
    );
  }
}
