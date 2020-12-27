import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate;

  _onSubmitted() {
    String titleEntered = _titleController.text;
    double amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered < 0 || _selectDate == null) return;

    widget.addTx(titleEntered, amountEntered,_selectDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((chosenDate) {
      if (chosenDate == null) return;

      setState(() {
        _selectDate = chosenDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => _onSubmitted(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmitted(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                        child: Text(_selectDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectDate)}'),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            FlatButton(
              onPressed: _onSubmitted,
              color: Theme.of(context).primaryColor,
              child: Text('Add Transaction'),
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ));
  }
}
