import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

//inheritance...extends
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //static const
  final _questions = const [
    //scoping
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 9}
      ],
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Dogs', 'score': 10},
        {'text': 'rouches', 'score': 5},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Cats', 'score': 9}
      ],
    },
    {
      'questionText': 'what\'s your favourite player?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'n', 'score': 5},
        {'text': 'as', 'score': 2},
        {'text': 'd', 'score': 9}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool =false;

    _totalScore += score;

    setState(() {
      //render ui/app
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more _Questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    //_questions = []; //doestn work if its a const

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    ); //constructor
  }
}
