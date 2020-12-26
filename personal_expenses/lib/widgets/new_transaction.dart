import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  onSubmitted() {
    String titleEntered = titleController.text;
    double amountEntered = double.parse(amountController.text);

    if (titleEntered.isEmpty || amountEntered < 0) return;

    widget.addTx(titleEntered, amountEntered);
    Navigator.of(context).pop();
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
              controller: titleController,
              onSubmitted: (_) => onSubmitted(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmitted(),
            ),
            FlatButton(
              onPressed: onSubmitted,
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ));
  }
}
