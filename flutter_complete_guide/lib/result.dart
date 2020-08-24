import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'you are aswesome';
    } else if (resultScore <= 12) {
      resultText = 'you are cruel';
    } else if (resultScore <= 16) {
      resultText = ' you are pretty';
    } else {
      resultText = 'youre bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Restart'),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
