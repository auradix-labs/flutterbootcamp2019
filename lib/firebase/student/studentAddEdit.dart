import 'package:flutter/material.dart';
import 'package:flutter_news/firebase/student/studentService.dart';

import 'model.dart';

class StudentForm extends StatefulWidget {
  Student student;

  StudentForm(this.student);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  Student student;
  final TextEditingController _nameController = TextEditingController();
  final _myFormKey = GlobalKey<FormState>();
  final StudentService _studentService = StudentService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = widget.student;
    _nameController.text = student.name;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Student'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _myFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Student Name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name can not be empty';
                      } else
                        return '';
                    },
                    onSaved: (value) {
                      student.name = value;
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      var form = _myFormKey.currentState;
                      if (form.validate()) {
                        form.save();
//                      invoke service to save object to firestore
                        _studentService.save(student);
//                        go back to list screen
                        Navigator.pop(context);
                      }
//                    print(_nameController.text);
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
