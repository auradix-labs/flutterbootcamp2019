import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
//  student properties
  String uid;
  String name;
  int rollNo;
  String guardianName;
  String email;

//  constructor
  Student({this.uid, this.name, this.rollNo, this.guardianName, this.email});

  // factory method for firebase only
  factory Student.formFirestore(DocumentSnapshot documentSnapshot) {
    Map<dynamic, dynamic> map = documentSnapshot.data;
    return Student(
      uid: documentSnapshot.documentID,
      name: map['name'],
      rollNo: map['rollNo'],
      guardianName: map['guardianName'],
      email: map['email'],
    );
  }

//  methods for conversion between map and object map ===> object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      rollNo: map['rollNo'],
      guardianName: map['guardianName'],
      email: map['email'],
    );
  }

//  method to convert object =====> map

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['rollNo'] = rollNo;
    map['guardianName'] = guardianName;
    map['email'] = email;
    return map;
  }
}
