import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String librarianName;
  final String task;

  Task({required this.id, required this.librarianName, required this.task});
}

class TasksTable extends StatelessWidget {

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _tasks;

  TasksTable({Key? key}) : super(key: key) {
    _tasks = _firestore.collection('tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [BoxShadow(offset: const Offset(0, 6), color: lightGrey.withOpacity(.1), blurRadius: 12)],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: (60 * 7) + 40,
        child: StreamBuilder<QuerySnapshot>(
          stream: _tasks.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return DataTable2(
              columnSpacing: 12,
              dataRowHeight: 60,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text('Librarian Name'),
                ),
                DataColumn(
                  label: Text('Task'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return DataRow(cells: [
                  DataCell(CustomText(text: data['librarian_name'] ?? 'N/A')),
                  DataCell(CustomText(text: data['task'] ?? 'N/A')),
                  DataCell(Container(
                    decoration: BoxDecoration(
                      color: light,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: active, width: .5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: CustomText(
                      text: "Edit",
                      color: active.withOpacity(.7),
                      weight: FontWeight.bold,
                    ),
                  )),
                ]);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}