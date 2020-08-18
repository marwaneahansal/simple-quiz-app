import 'package:flutter/material.dart';
import 'package:quiz_app/quizSelection.dart';

import 'helperWidget/CircleScoe.dart';

class Score extends StatefulWidget {
  final List<String> questions;
  final List<String> correctAnswer;
  final Map<String, String> userAnswers;
  final List score;

  Score({this.questions, this.userAnswers, this.correctAnswer, this.score});
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> with SingleTickerProviderStateMixin {
  AnimationController scoreAnimationControler;
  Animation animation;
  int score = 0;
  @override
  void initState() {
    score = widget.score[0];
    scoreAnimationControler = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    animation =
        Tween(begin: 0, end: score.toDouble()).animate(scoreAnimationControler)
          ..addListener(() {
            setState(() {});
          });

    scoreAnimationControler.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFFF3F3F4),
        title: Text(
          // 'General Knowledge',
          'Your Score',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomPaint(
              foregroundPainter:
                  CircleProgress(correctAnswers: animation.value.toDouble()),
              child: Container(
                width: 200,
                height: 200,
                child: Center(child: Text('${animation.value.toInt()}/10')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizSelection()),
                );
              },
              color: Color(0xFF6C63FF),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                "Try Again! ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Your Answers: ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.userAnswers.length,
                itemBuilder: (context, index) {
                  return (widget.score[1].contains(index))
                      ? Card(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Wrap(
                              children: [
                                Text(
                                  '${widget.questions[index]}: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${widget.userAnswers.values.toList()[index]} ',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Card(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Wrap(
                              children: [
                                Text(
                                  '${widget.questions[index]}: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${widget.userAnswers.values.toList()[index]} ',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
