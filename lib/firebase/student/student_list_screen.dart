import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/firebase/student/studentAddEdit.dart';

import 'model.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  var db = Firestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentForm()));
      }),
      body: Container(
        child: StreamBuilder(
          stream: db.snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                Student student =
                    Student.fromMap(snapshot.data.documents[index].data);
                return Card(
                    child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(student.name),
                  subtitle: Text(student.email),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
