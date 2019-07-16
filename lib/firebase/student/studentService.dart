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

  Future<Student> search(String roll)async {
    Student _s;
    await _db.where("rollNo", isEqualTo: int.parse(roll)).getDocuments().then((snapshot) {
      if (snapshot.documents.length > 0) {
        var snap = snapshot.documents[0];
        _s = Student.formFirestore(snap);
      } else {
        _s = null;
      }
      print("returning form service");
    });
    return _s;
  }
}
