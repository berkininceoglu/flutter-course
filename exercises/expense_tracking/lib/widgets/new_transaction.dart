import 'package:flutter/material.dart';
import './user_transactions.dart';

class NewTransaction extends StatelessWidget {
  @override
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitTransaction() {
    final titleInput = titleController.text;
    final amountInput = double.parse(amountController.text);

    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }

    addTx(
      titleInput,
      amountInput,
    );
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
