import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function resetHandler;

  String get resultPhrase {
    var resultMessage = "Congrats ";
    if (result < 3) {
      resultMessage = resultMessage + ", you suck!";
    } else {
      resultMessage = resultMessage + "mate, u r g8!";
    }
    return resultMessage;
  }

  Result(this.result, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Score: " + result.toString(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text("Try again."),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
