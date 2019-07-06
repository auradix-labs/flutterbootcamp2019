import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_news/firebase/student/model.dart';

class StudentService {
  final _db = Firestore.instance.collection('students');

  list() {}

  save(Student student) async {
    student.uid != null
        ? await _db.document(student.uid).setData(student.toMap(), merge: true)
        : await _db.add(student.toMap());
  }

  read() {}

  delete(Student student) {
    _db.document(student.uid).delete();
  }
}
