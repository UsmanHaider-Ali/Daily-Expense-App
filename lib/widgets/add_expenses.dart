import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenses extends StatefulWidget {
  final Function _newExpHandler;

  AddExpenses(this._newExpHandler);

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate;
  void _addNewExp() {
    String title = _titleController.text;
    if (_amountController.text.isEmpty) {
      return;
    }
    double amount = double.parse(_amountController.text);
    if (title.isEmpty ||
        amount.isNegative ||
        amount.toString().isEmpty ||
        _selectedDate == null) {
      return;
    }
    widget._newExpHandler(_titleController.text,
        double.parse(_amountController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'Expense Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
              ),
              onSubmitted: (_) => _addNewExp(),
              controller: _titleController,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Amount'),
                border: OutlineInputBorder(),
                hintText: 'Enter Amount',
              ),
              onSubmitted: (_) => _addNewExp(),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 4,
              ),
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : 'Selected Date:  ${DateFormat.yMMMMd().format(_selectedDate)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: _selectDate,
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _addNewExp(),
              child: Text(
                'Add Expense',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
