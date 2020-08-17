import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/schemas/questionsAnswers.dart';
import 'package:quiz_app/score.dart';
import 'package:quiz_app/styles/widgetStyles.dart';

class Quiz extends StatefulWidget {
  final String quizCategoryKey;
  final String quizCategoryValue;
  final String quizDifficulty;
  Quiz({this.quizCategoryKey, this.quizCategoryValue, this.quizDifficulty});
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final controller = PageController(initialPage: 0);
  int questionNumber;
  Future<QuestionAnswers> questionAnswers;
  Map<String, String> userAnswers = Map<String, String>();

  Future<QuestionAnswers> _getQuistionsAndAnswers() async {
    final result = await http.get(
        'https://opentdb.com/api.php?amount=10&category=${widget.quizCategoryKey}&difficulty=${widget.quizDifficulty.toLowerCase()}&type=boolean');

    if (result.statusCode == 200) {
      return QuestionAnswers.fromJson(json.decode(result.body));
    }
    throw Exception('Failed to load data from the server');
  }

  @override
  void initState() {
    questionAnswers = _getQuistionsAndAnswers();
    questionNumber = controller.initialPage + 1;
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
          widget.quizCategoryValue,
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
        bottom: PreferredSize(
            child: WidgetStyles.questionIndicator(
                context: context, questionNumber: questionNumber),
            preferredSize: Size.fromHeight(6)),
      ),
      body: FutureBuilder<QuestionAnswers>(
        future: questionAnswers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        'Question $questionNumber',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.lightBlue,
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.questions.length,
                        itemBuilder: (context, index) {
                          return WidgetStyles.questionsWidget(
                            context: context,
                            question: snapshot.data.questions[index],
                            trueAnswer: _trueAnswer,
                            flaseAnswer: _falseAnswer,
                          );
                        },
                        controller: controller,
                        onPageChanged: (value) {
                          print(userAnswers);
                          setState(() {
                            questionNumber = value + 1;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _trueAnswer() {
    if (questionNumber == 10) {
      userAnswers[(questionNumber - 1).toString()] = "true";
      List<String> questions;
      List<String> correctAnswers;
      questionAnswers.then((value) {
        questions = value.questions;
        correctAnswers = value.correctAnswers;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Score(
                  questions: questions,
                  correctAnswer: correctAnswers,
                  userAnswers: userAnswers,
                )),
      );
    } else {
      userAnswers[(questionNumber - 1).toString()] = "true";
    }
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void _falseAnswer() {
    if (questionNumber == 10) {
      userAnswers[(questionNumber - 1).toString()] = "false";
      List<String> questions;
      List<String> correctAnswers;
      questionAnswers.then((value) {
        questions = value.questions;
        correctAnswers = value.correctAnswers;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Score(
                  questions: questions,
                  correctAnswer: correctAnswers,
                  userAnswers: userAnswers,
                )),
      );
    } else {
      userAnswers[(questionNumber - 1).toString()] = "false";
    }
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
