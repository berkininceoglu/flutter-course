import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

final _questions = [
  {
    "question": "What type of plan are you into?",
    "answers": [
      {'text': "Bar", 'isCorrect': true},
      {'text': "Pub", 'isCorrect': false},
      {'text': "Diner", 'isCorrect': false},
      {'text': "Coffee", 'isCorrect': false},
    ]
  },
  {
    "question": "When you are available?",
    "answers": [
      {'text': "Bar", 'isCorrect': true},
      {'text': "Pub", 'isCorrect': false},
      {'text': "Diner", 'isCorrect': false},
      {'text': "Coffee", 'isCorrect': false},
    ]
  },
  {
    "question": "What time you could make it?",
    "answers": [
      {'text': "Bar", 'isCorrect': true},
      {'text': "Pub", 'isCorrect': false},
      {'text': "Diner", 'isCorrect': false},
      {'text': "Coffee", 'isCorrect': false},
    ]
  },
  {
    "question": "What are you going to use as transportation?",
    "answers": [
      {'text': "Bar", 'isCorrect': true},
      {'text': "Pub", 'isCorrect': false},
      {'text': "Diner", 'isCorrect': false},
      {'text': "Coffee", 'isCorrect': false},
    ]
  },
];

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _score = 0;
  @override
  Widget build(BuildContext context) {
    void _ResetQuiz() {
      setState(() {
        _score = 0;
        _questionIndex = 0;
      });
    }

    void _AnswerQuestion(bool isCorrect) {
      setState(() {
        if (isCorrect) {
          _score = _score + 1;
        }
        _questionIndex = (_questionIndex + 1); // % 4;
      });
      if (_questionIndex == _questions.length) {
        print("questions are finished");
        print(_score);
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Berkin - Flutter App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                AnswerQuestion: _AnswerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_score, _ResetQuiz),
      ),
    );
  }
}
