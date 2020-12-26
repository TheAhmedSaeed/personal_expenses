import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          height: 600,
          child: ListView.builder(
            itemBuilder: (ctx,index) { 
              return Card(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor)),
                            child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactions[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat().add_yMEd().format(transactions[index].date),
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    );
             } ,
            itemCount: transactions.length,
         
          ),
        ),
      ],
    );
  }
}
