import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  final String text;

  Output(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.only(top: 30),
    );
  }
}
