import 'package:expense_tracking/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  @override
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: transactions.map((e) {
      return Card(
          child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              '\$${e.amount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.purple,
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            padding: EdgeInsets.all(8),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              e.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat().format(e.date),
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ])
        ],
      ));
    }).toList()));
  }
}
