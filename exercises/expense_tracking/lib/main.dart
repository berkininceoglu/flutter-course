import 'package:expense_tracking/widgets/user_transactions.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracking"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Card(
                child: Text("Chart!"),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
