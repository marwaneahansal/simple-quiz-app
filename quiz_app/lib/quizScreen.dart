import 'package:flutter/material.dart';
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
  int questionNumber = 1;

  void incrementQuestinNumber() {
    setState(() {
      questionNumber++;
    });
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
            child: WidgetStyles.questionIndicator(context: context),
            preferredSize: Size.fromHeight(6)),
      ),
      body: Container(
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'The question asked??',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WidgetStyles.answerBtn(
                            context: context,
                            text: 'true',
                            pressedFunc: incrementQuestinNumber),
                        WidgetStyles.answerBtn(
                            context: context,
                            text: 'false',
                            pressedFunc: incrementQuestinNumber),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
