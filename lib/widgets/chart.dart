import 'package:flutter/material.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (int i = 0; i < widget.recentTransactions.length; i++) {
        if (widget.recentTransactions[i].date.day == weekDay.day &&
            widget.recentTransactions[i].date.month == weekDay.month &&
            widget.recentTransactions[i].date.year == weekDay.year) {
          totalSum += widget.recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   elevation: 6,
    //   margin: EdgeInsets.all(20),
    //   child: Padding(
    //     padding: EdgeInsets.all(10),
    //     child: Column(
    //       children: [
    //         Text(
    //           'Expenses Of this Week',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.brown,
    //             fontSize: 15,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: groupTransactionValues.map((data) {
    //             return Flexible(
    //               fit: FlexFit.tight,
    //               child: ChartBar(
    //                 data['day'].toString(),
    //                 (data['amount'] as double),
    //                 maxSpending == 0.0
    //                     ? 0.0
    //                     : (data['amount'] as double) / maxSpending,
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         Text(
    //           'Total Amount Spent htis week:- ' + maxSpending.toString(),
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.brown,
    //             fontSize: 15,
    //             fontFamily: 'Quicksand',
    //           ),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         )
    //       ],
    //     ),
    //   ),
    // );

    // return LayoutBuilder(builder: (ctx, constraints) {
    //   return Card(
    //     elevation: 6,
    //     margin: EdgeInsets.all(20),
    //     child: Padding(
    //       padding: EdgeInsets.all(10),
    //       child: Column(
    //         children: [
    //           Text(
    //             'Expenses Of this Week',
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Colors.brown,
    //               fontSize: 15,
    //             ),
    //           ),
    //           SizedBox(
    //             height: constraints.maxHeight * 0.05,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: groupTransactionValues.map((data) {
    //               return Flexible(
    //                 fit: FlexFit.tight,
    //                 child: ChartBar(
    //                   data['day'].toString(),
    //                   (data['amount'] as double),
    //                   maxSpending == 0.0
    //                       ? 0.0
    //                       : (data['amount'] as double) / maxSpending,
    //                 ),
    //               );
    //             }).toList(),
    //           ),
    //           SizedBox(
    //             height: constraints.maxHeight * 0.05,
    //           ),
    //           Text(
    //             'Total Amount Spent htis week:- ' + maxSpending.toString(),
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Colors.brown,
    //               fontSize: 15,
    //               fontFamily: 'Quicksand',
    //             ),
    //           ),
    //           SizedBox(
    //             height: constraints.maxHeight * 0.05,
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // });

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                (data['amount'] as double),
                maxSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / maxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
