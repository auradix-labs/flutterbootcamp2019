import 'package:flutter/material.dart';
import 'package:flutter_news/firebase/student/studentService.dart';
import 'package:flutter_news/firebase/student/student_list_screen.dart';

import 'model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var idController = TextEditingController();

  Student foundStudent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('List'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentList()));
              },
            ),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'Search student Id'),
                ),
                RaisedButton(
                  child: Text('Search'),
                  onPressed: () {
                    var roll = idController.text;
//                    get the student as Future<Student> from student service
                    StudentService().search(roll).then((myStudent) {
                        if (myStudent != null) {
                          setState(() {
                            print("setting found student");
                            foundStudent = myStudent;
                          });
                        }
                      },
                    );
                  },
                ),
              ],
            )),
            foundStudent != null
                ? Text("Student Found, Name: ${foundStudent.name}")
                : Text('No student found')
          ],
        ),
      ),
    );
  }
}
