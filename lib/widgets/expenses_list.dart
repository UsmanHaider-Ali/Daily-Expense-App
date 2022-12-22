import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> _expensesList;
  final Function _deleteExp;
  ExpensesList(this._expensesList, this._deleteExp);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: _expensesList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    '\$${_expensesList[index].amount.toStringAsFixed(2)}',
                    // style: TextStyle(
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.w500,
                    // ),
                  ),
                ),
              ),
            ),
            title: Text(
              _expensesList[index].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle:
                Text(DateFormat.yMMMd().format(_expensesList[index].date)),
            trailing: IconButton(
              onPressed: (() => {
                    _deleteExp(_expensesList[index].id),
                  }),
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
        );
        // return Card(
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        //     child: Row(
        //       children: [
        //         Container(
        //           padding: EdgeInsets.all(8),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(8),
        //             border: Border.all(
        //               color: Theme.of(context).primaryColor,
        //               width: 2,
        //             ),
        //           ),
        //           child: Text(
        //             '${_expensesList[index].amount.toStringAsFixed(2)}\$',
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ),
        //         Container(
        //           margin: EdgeInsets.only(left: 16),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 _expensesList[index].title,
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //               Text(
        //                 DateFormat.yMMMd().format(_expensesList[index].date),
        //                 style: TextStyle(
        //                   fontSize: 14,
        //                   color: Colors.grey,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
