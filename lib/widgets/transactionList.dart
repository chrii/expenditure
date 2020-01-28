import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userTransactions
            .map(
              (f) => Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyan, width: 1)),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Text(
                        '${f.amount.toString()} €',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.cyan),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          f.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('EEEE, d.LLL.y').format(f.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
            .toList());
  }
}
