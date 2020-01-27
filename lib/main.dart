import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expenditures', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(id: "1", title: "Shoes", amount: 80.0, date: DateTime.now()),
      Transaction(id: "2", title: "Food", amount: 20.0, date: DateTime.now()),
      Transaction(
          id: "3", title: "Alcohol", amount: 34.90, date: DateTime.now()),
      Transaction(id: "4", title: "Sweets", amount: 9.51, date: DateTime.now()),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Expeditures'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text('card'),
              ),
              elevation: 5,
            ),
            Column(
                children: transactions
                    .map(
                      (f) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.cyan, width: 1)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
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
                    .toList())
          ],
        ));
  }
}
