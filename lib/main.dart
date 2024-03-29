import 'package:flutter/material.dart';
import 'package:flutter_news/tltc/tltc.dart';

import 'firebase/student/search_screen.dart';
import 'firebase/student/studentAddEdit.dart';
import 'firebase/student/student_list_screen.dart';
import 'lamp/lamp.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SearchScreen(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
