import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class TasksForm extends StatefulWidget {
  @override
  _TasksFormState createState() => _TasksFormState();
}

class _TasksFormState extends State<TasksForm> {
  final _formKey = GlobalKey<FormState>();
  final _librarianNameController = TextEditingController();
  final _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Firebase initialized");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _librarianNameController,
            decoration: InputDecoration(labelText: "Librarian's Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Librarian in charge';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _taskController,
            decoration: InputDecoration(labelText: 'Task'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a task';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                CollectionReference tasks =
                    FirebaseFirestore.instance.collection('tasks');
                await tasks.add({
                  'librarian_name': _librarianNameController.text,
                  'task': _taskController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Task Added')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}