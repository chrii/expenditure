import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function createTransaction;

  NewTransaction(this.createTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    createTransaction(
        titleController.text, double.parse(amountController.text));
  }

  build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitTransaction(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitTransaction(),
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.cyan,
            onPressed: submitTransaction,
          )
        ],
      ),
    ));
  }
}
