import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  @override
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitTransaction() {
    final titleInput = titleController.text;
    final amountInput = double.parse(amountController.text);

    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }

    widget.addTx(
      titleInput,
      amountInput,
    );

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitTransaction(),
            ),
            FlatButton(
              onPressed: submitTransaction,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
