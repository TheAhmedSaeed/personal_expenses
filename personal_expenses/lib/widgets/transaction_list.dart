import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return
        Container(
          height: 400,
          child: transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 200,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: FittedBox(
                                child: Text('\$${transactions[index].amount}')),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(transactions[index].date)),
                        trailing: IconButton(
                          onPressed: () {
                            deleteTransaction(transactions[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ),
                    );
                    // return Card(
                    //         child: Row(
                    //           children: [
                    //             Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin:
                    //                   EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: Theme.of(context).primaryColor)),
                    //               child: Text(
                    //                 '\$${transactions[index].amount.toStringAsFixed(2)}',
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 20,
                    //                     color: Theme.of(context).primaryColor),
                    //               ),
                    //             ),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   transactions[index].title,
                    //                   style: Theme.of(context).textTheme.title                            ),
                    //                 Text(
                    //                   DateFormat().add_yMEd().format(transactions[index].date),
                    //                   style: TextStyle(fontSize: 14, color: Colors.grey),
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       );
                  },
                  itemCount: transactions.length,
                ),
    );
  }
}
