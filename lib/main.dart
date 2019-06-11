import 'package:flutter/material.dart';
import 'package:flutter_news/dice.dart';

void main() {
  runApp(
    MaterialApp(title: "My App", home: DicePage()),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('1'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('2'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: Text('2'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
