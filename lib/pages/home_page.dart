import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import '../widgets/add_expenses.dart';
import '../widgets/expenses_graph.dart';
import '../widgets/expenses_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ExpenseModel> _expensesList = [
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 50.52,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 10.25,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    ExpenseModel(
      id: '145',
      title: 'Mouse',
      amount: 60.25,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 50.52,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 10.25,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    ExpenseModel(
      id: '145',
      title: 'Mouse',
      amount: 60.25,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 50.52,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 10.25,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    ExpenseModel(
      id: '145',
      title: 'Mouse',
      amount: 60.25,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 50.52,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 10.25,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    ExpenseModel(
      id: '145',
      title: 'Mouse',
      amount: 60.25,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
  ];

  void _deleteExp(String expID) {
    setState(() {
      _expensesList.removeWhere(
        (element) => element.id == expID,
      );
    });
  }

  void _startAddNewExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddExpenses(_addNewExpense);
      },
    );
  }

  void _addNewExpense(String title, double amount, DateTime selectedDate) {
    final newExp = ExpenseModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: selectedDate,
    );

    setState(() {
      _expensesList.add(newExp);
    });
  }

  List<ExpenseModel> get _recentExpenses {
    return _expensesList.where((exp) {
      return exp.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
            onPressed: (() => _startAddNewExpense(context)),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.8,
                child: ExpensesGraph(_recentExpenses),
              ),
              SizedBox(
                height: 4,
              ),
              (_expensesList.isEmpty)
                  ? Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            'assets/images/empty_list.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'No Expenses Found',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  : ExpensesList(_expensesList, _deleteExp),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _startAddNewExpense(context)),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
