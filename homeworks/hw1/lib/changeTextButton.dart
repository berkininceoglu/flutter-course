import 'package:flutter/material.dart';

class ChangeTextButton extends StatelessWidget {
  final Function pressHandler;

  ChangeTextButton(this.pressHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Change Text!"),
        onPressed: pressHandler,
      ),
      padding: EdgeInsets.only(top: 30),
    );
  }
}
