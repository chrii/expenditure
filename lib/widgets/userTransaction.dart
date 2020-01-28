import 'package:expenditure/widgets/newTransaction.dart';
import 'package:expenditure/widgets/transactionList.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "1", title: "Shoes", amount: 80.0, date: DateTime.now()),
    Transaction(id: "2", title: "Food", amount: 20.0, date: DateTime.now()),
    Transaction(id: "3", title: "Alcohol", amount: 34.90, date: DateTime.now()),
    Transaction(id: "4", title: "Sweets", amount: 9.51, date: DateTime.now()),
  ];

  void createTransaction(String title, double amount) {
    final _userTransactionsLength = _userTransactions.length;
    final _newUserId = (_userTransactionsLength + 1).toString();
    final _transaction = Transaction(
        id: _newUserId, title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransactions.add(_transaction);
    });
  }

  build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(createTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
