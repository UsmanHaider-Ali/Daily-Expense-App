import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/expense_model.dart';
import '../widgets/chart_bar.dart';

class ExpensesGraph extends StatelessWidget {
  final List<ExpenseModel> _recentExpensesList;
  ExpensesGraph(this._recentExpensesList);

  List<Map<String, Object>> get _groupedExpensesValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < _recentExpensesList.length; i++) {
        if (_recentExpensesList[i].date.day == weekDay.day &&
            _recentExpensesList[i].date.month == weekDay.month &&
            _recentExpensesList[i].date.year == weekDay.year) {
          totalSum += _recentExpensesList[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum.toStringAsFixed(0),
      };
    });
  }

  double get _maxSpending {
    return _groupedExpensesValues.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedExpensesValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                double.parse(data['amount'].toString()),
                _maxSpending == 0
                    ? 0.0
                    : double.parse(data['amount'].toString()) / _maxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
