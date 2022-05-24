import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}
//shorthand
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //_ 'underscore' to make the class private
  final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'black', 'score': 10}, 
          {'text': 'red', 'score': 5}, 
          {'text': 'green', 'score': '3'}, 
          {'text': 'white', 'score': 1}
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'rabbit', 'score': 3}, 
          {'text': 'snake', 'score': 11}, 
          {'text': 'elephant', 'score': 5}, 
          {'text': 'lion', 'score': 9},
        ],
      },
      { 
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Noper', 'score': 1}, 
          {'text': 'Noper', 'score': 1},
          {'text': 'Noper', 'score': 1},
          {'text': 'Noper', 'score': 1},
        ],
      }
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    // var aBool = true;

    _totalScore += score;
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length){
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first app'),
        ),
        body: _questionIndex < _questions.length ?
        Quiz(
        questions: _questions, 
        answerQuestions: _answerQuestions, 
        questionIndex: _questionIndex,
        )
        :
        Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
