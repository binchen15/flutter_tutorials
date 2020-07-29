import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final int totalScore;

  Result(this.resetQuiz, this.totalScore);

  String get resultPhrase {
    if (totalScore < 10) {
      return "You are awesome! ($totalScore)";
    } else if (totalScore < 20) {
      return "You are good!";
    } else {
      return "You are strange!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FlatButton(
          child: Text('Reset'),
          onPressed: resetQuiz,
        ),
      ],
    );
  }
}
