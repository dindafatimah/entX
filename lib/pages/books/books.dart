import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/books/widgets/books_table.dart';
import 'package:flutter_web_dashboard/pages/books/widgets/book_form.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
          label: Text(_showForm ? 'Hide Form' : 'Add Book'),
        ),
        Visibility(
          visible: _showForm,
          child: AddBookForm(),
        ),
        Expanded(
            child: ListView(
          children: [BooksTable(),
          ],
        )),
      ],
    );
  }
}