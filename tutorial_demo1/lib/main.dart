import 'package:flutter/material.dart';
import 'package:tutorial_demo1/quiz.dart';
import "package:tutorial_demo1/result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  List<Map<String, Object>> questions = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {'text': "Black", 'score': 10},
        {'text': "Red", 'score': 8},
        {'text': "Green", 'score': 6},
        {'text': "White", 'score': 4},
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {'text': "Snake", 'score': 10},
        {'text': "Tiger", 'score': 8},
        {'text': "Dog", 'score': 6},
        {'text': "Cat", 'score': 4},
      ]
    },
    {
      "question": "Who is your favorite instructor?",
      "answers": [
        {'text': "Max", 'score': 10},
        {'text': "Max", 'score': 8},
        {'text': "Max", 'score': 6},
        {'text': "Max", 'score': 4},
      ]
    }
  ];

  void answerQuestion(score) {
    setState(() {
      questionIndex += 1;
      totalScore += score;
    });
    print("Question index: $questionIndex");
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("First App")),
          body: questionIndex >= questions.length
              ? Result(resetQuiz, totalScore)
              : Quiz(answerQuestion, questions[questionIndex])),
    );
  }
}
