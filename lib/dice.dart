import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: FlatButton(
              child: Image.asset('assets/images/dice$diceNumber.png'),
              onPressed: () {
                setState(() {
                  diceNumber =Random().nextInt(6)+1;
                  print(diceNumber);
                });
              },
            ),
          )),
        ],
      ),
    );
  }
}
