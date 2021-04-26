import 'package:expense_tracking/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "1",
      title: "Groceries",
      amount: 10.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Meat",
      amount: 4.99,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Berkin"),
        ),
        body: Column(
            children: transactions.map((e) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  e.amount.toString() + "\$",
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
                  e.date.toString(),
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
