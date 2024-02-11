import 'package:flutter/material.dart';

class LendingForm extends StatefulWidget {
  @override
  _LendingFormState createState() => _LendingFormState();
}

class _LendingFormState extends State<LendingForm> {
  final _formKey = GlobalKey<FormState>();
  final _memberIdController = TextEditingController();
  final _bookIdsController = TextEditingController();
  DateTime? _lendingDate;
  DateTime? _returnDate;
  String? _status = 'Lent';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _memberIdController,
            decoration: InputDecoration(labelText: 'Member ID'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a member ID';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          TextFormField(
            controller: _bookIdsController,
            decoration: InputDecoration(labelText: 'Book IDs (separated by commas)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter book IDs';
              }
              return null;
            },
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () async {
              _lendingDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              setState(() {});
            },
            child: Text(_lendingDate == null ? 'Pick Lending Date' : 'Lending Date: ${_lendingDate!.toIso8601String()}'),
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () async {
              _returnDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              setState(() {});
            },
            child: Text(_returnDate == null ? 'Pick Return Date' : 'Return Date: ${_returnDate!.toIso8601String()}'),
          ),
          SizedBox(height: 20), // Add space
          ListTile(
            title: const Text('Lent'),
            leading: Radio<String>(
              value: 'Lent',
              groupValue: _status,
              onChanged: (String? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Returned'),
            leading: Radio<String>(
              value: 'Returned',
              groupValue: _status,
              onChanged: (String? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
          ),
          SizedBox(height: 20), // Add space
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data')),
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