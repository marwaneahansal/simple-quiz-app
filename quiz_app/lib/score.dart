import 'package:flutter/material.dart';

import 'helperWidget/CircleScoe.dart';

class Score extends StatefulWidget {
  final List<String> questions;
  final List<String> correctAnswer;
  final Map<String, String> userAnswers;

  Score({this.questions, this.userAnswers, this.correctAnswer});
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> with SingleTickerProviderStateMixin {
  AnimationController scoreAnimationControler;
  Animation animation;
  @override
  void initState() {
    List<String> userAnswersKeys = widget.userAnswers.keys.toList();
    super.initState();

    scoreAnimationControler = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 0, end: 9.0).animate(scoreAnimationControler)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    scoreAnimationControler.forward();
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
      body: Column(
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.userAnswers.length,
              itemBuilder: (context, index) {
                return Wrap(
                  children: [
                    Text('${widget.questions[index]}: '),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${widget.userAnswers.values.toList()[index]} '),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
