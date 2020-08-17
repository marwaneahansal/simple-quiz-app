import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  final List<String> questions;
  final List<String> correctAnswer;
  final Map<String, String> userAnswers;

  Score({this.questions, this.userAnswers, this.correctAnswer});
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView.builder(
            itemCount: widget.userAnswers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text('${widget.userAnswers.keys.toList()[index]}: '),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${widget.userAnswers.values.toList()[index]}: '),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
