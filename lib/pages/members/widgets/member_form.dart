import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AddMemberForm extends StatefulWidget {
  @override
  _AddMemberFormState createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

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
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(labelText: 'Address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an address';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                CollectionReference members =
                    FirebaseFirestore.instance.collection('members');
                await members.add({
                  'name': _nameController.text,
                  'address': _addressController.text,
                  'email': _emailController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Member Added')),
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
