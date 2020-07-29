import 'package:flutter/material.dart';
import 'package:tutorial_demo1/answer.dart';
import 'package:tutorial_demo1/question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final Map<String, Object> questionMap;

  Quiz(this.answerQuestion, this.questionMap);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionMap['question']),
        ...(questionMap['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
