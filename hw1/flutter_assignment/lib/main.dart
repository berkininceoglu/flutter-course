// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import 'changeTextButton.dart';
import './output.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _text = "Welcome to my first assignment!";
  var alternativeText = "This is the text I have chosen for change";
  void _changeText() {
    setState(() {
      _text = alternativeText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Berkin - Flutter Assignment"),
        ),
        body: Center(
          child: Column(
            children: [
              Output(_text),
              ChangeTextButton(_changeText),
            ],
          ),
        ),
      ),
    );
  }
}
