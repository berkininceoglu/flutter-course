import 'package:expense_tracking/widgets/adaptiveFlatButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  @override
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitTransaction() {
    if (_amountController.text == null) {
      return;
    }
    final titleInput = _titleController.text;
    final amountInput = double.parse(_amountController.text);

    if (titleInput.isEmpty || amountInput <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      titleInput,
      amountInput,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                  onSubmitted: (_) => submitTransaction(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitTransaction(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? "No date chosen!"
                              : 'Picked Date:' +
                                  DateFormat.yMd().format(_selectedDate),
                        ),
                      ),
                      AdaptiveFlatButton('Choose Date', _presentDatePicker),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: submitTransaction,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).buttonColor,
                  child: Text("Add Transaction"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
