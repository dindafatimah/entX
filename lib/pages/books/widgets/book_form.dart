import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AddBookForm extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _isbnController = TextEditingController();

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
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _authorController,
            decoration: InputDecoration(labelText: 'Author'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an author';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _isbnController,
            decoration: InputDecoration(labelText: 'ISBN'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an ISBN';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                CollectionReference books =
                    FirebaseFirestore.instance.collection('books');
                await books.add({
                  'title': _titleController.text,
                  'author': _authorController.text,
                  'isbn': _isbnController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Book Added')),
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