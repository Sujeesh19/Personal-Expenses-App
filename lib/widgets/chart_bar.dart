import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPerOfTotal);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: <Widget>[
    //     Container(
    //       height: 20,
    //       child: FittedBox(
    //         child: Text('\Rs.${spendingAmount.toStringAsFixed(0)}'),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 4,
    //     ),
    //     Container(
    //       height: 90,
    //       width: 10,
    //       child: Stack(
    //         children: <Widget>[
    //           Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                   color: Color.fromARGB(255, 215, 213, 213), width: 1.0),
    //               color: Color.fromARGB(255, 248, 247, 244),
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //           FractionallySizedBox(
    //             heightFactor: spendingPerOfTotal,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Theme.of(context).primaryColor,
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 4,
    //     ),
    //     Text(label),
    //   ],
    // );

    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.11,
            child: FittedBox(
              child: Text('\u{20B9}.${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.02,
          ),
          Container(
            height: constraints.maxHeight * 0.7,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 215, 213, 213), width: 1.0),
                    color: Color.fromARGB(255, 248, 247, 244),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPerOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.03,
          ),
          Container(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
