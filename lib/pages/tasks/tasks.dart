import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/tasks/widgets/tasks_table.dart';
import 'package:flutter_web_dashboard/pages/tasks/widgets/tasks_form.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // background
            onPrimary: Colors.white, // foreground
            padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 12), // padding
            textStyle: TextStyle(fontSize: 20), // text size
          ),
          onPressed: () {
            setState(() {
              _showForm = !_showForm;
            });
          },
          icon: Icon(Icons.add),
          label: Text(_showForm ? 'Hide Form' : 'Add Task'),
        ),
        Visibility(
          visible: _showForm,
          child: TasksForm(),
        ),
        Expanded(
            child: ListView(
          children: [TasksTable(),
          ],
        )),
      ],
    );
  }
}
