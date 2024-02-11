import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/pages/lending/lending.dart';


class LendingRecord {
  final String memberId;
  final String booksLent;
  final String lendingDate;
  final String returnDate;
  final String status;

  LendingRecord(this.memberId, this.booksLent, this.lendingDate, this.returnDate, this.status);
}

class RecentLendingsTable extends StatelessWidget {
  const RecentLendingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of records
    List<LendingRecord> lendingRecords = [
      LendingRecord('A001', "One of Us Is Lying, A Yellow House", '2024-01-01', '2022-02-01', 'Lent'),
      LendingRecord('A002', "The Universe in Your Hand", '2024-01-02', '2022-02-02', 'Returned'),
      LendingRecord('A003', "Big Questions in Science", '2024-01-03', '2022-02-03', 'Lent'),
      LendingRecord('A004', "Kafka on the Shore, The Fall", '2024-01-04', '2022-02-04', 'Returned'),
      LendingRecord('A005', "How to Cure a Ghost, The Little Prince", '2024-01-05', '2022-02-05', 'Lent'),
      LendingRecord('A006', "The Strange Library, See You in the Cosmos", '2024-01-06', '2022-02-06', 'Returned'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [BoxShadow(offset: const Offset(0, 6), color: lightGrey.withOpacity(.1), blurRadius: 12)],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Recent Lendings",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LendingsPage()), // replace with your form page
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: (56 * lendingRecords.length) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text("Members ID"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Books Lent'),
                ),
                DataColumn(
                  label: Text('Lending Date'),
                ),
                DataColumn(
                  label: Text('Return Date'),
                ),
                DataColumn(
                  label: Text('Status'),
                ),
              ],
              rows: lendingRecords.map(
                (record) => DataRow(
                  cells: [
                    DataCell(CustomText(text: record.memberId)),
                    DataCell(CustomText(text: record.booksLent.toString())),
                    DataCell(CustomText(text: record.lendingDate)),
                    DataCell(CustomText(text: record.returnDate)),
                    DataCell(
                      CustomText(
                        text: record.status,
                        color: record.status == "Lent" ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}