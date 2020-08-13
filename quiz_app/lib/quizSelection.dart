import 'package:flutter/material.dart';
import 'package:quiz_app/styles/widgetStyles.dart';
import 'package:quiz_app/widgets/dropDownMenu.dart';

class QuizSelection extends StatefulWidget {
  @override
  _QuizSelectionState createState() => _QuizSelectionState();
}

class _QuizSelectionState extends State<QuizSelection> {
  Map<String, String> catDropDownItems = {
    '9': 'General knowledge',
    '10': 'Books',
    '11': 'Film',
    '12': 'Music',
    '15': 'Video Games',
    '21': 'Sport',
    '19': 'Matemathics',
    '18': 'Computers'
  };

  List<String> difficultyDropDownItems = ['Easy', 'Meduim', 'Hard'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF3F3F4),
        body: Center(
          child: Container(
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Select category:',
                    style: WidgetStyles.labelTextStyle,
                  ),
                  DropDownWidget(
                    dropDownItems: catDropDownItems,
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Select difficulty:',
                    style: WidgetStyles.labelTextStyle,
                  ),
                  DifficultyDropDownMenu(
                    diffcultyItems: difficultyDropDownItems,
                  )
                ]),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {},
                  color: Color(0xFF6C63FF),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Start Quiz",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
