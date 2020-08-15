import 'package:flutter/material.dart';
import 'package:quiz_app/quizScreen.dart';
import 'package:quiz_app/styles/widgetStyles.dart';

class QuizSelection extends StatefulWidget {
  final Map<String, String> catDropDownItems = {
    '9': 'General Knowledge',
    '10': 'Books',
    '11': 'Film',
    '12': 'Music',
    '15': 'Video Games',
    '21': 'Sport',
    '19': 'Matemathics',
    '18': 'Computers'
  };

  final List<String> difficultyDropDownItems = ['Easy', 'Medium', 'Hard'];

  @override
  _QuizSelectionState createState() => _QuizSelectionState();
}

class _QuizSelectionState extends State<QuizSelection> {
  String categoryValue;
  List<String> categoryNames;
  String difficultyValue;
  String categoryCode;

  @override
  void initState() {
    this.categoryNames = widget.catDropDownItems.values.toList();
    this.categoryValue = this.categoryNames[0];
    this.difficultyValue = widget.difficultyDropDownItems[0];
    this.categoryCode = '9';
    super.initState();
  }

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
                  DropdownButton(
                    isExpanded: true,
                    value: this.categoryValue,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      height: 2,
                      color: Color(0XFF364f6b),
                    ),
                    items: this.categoryNames.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      String key = widget.catDropDownItems.keys.firstWhere(
                          (element) =>
                              widget.catDropDownItems[element] == value,
                          orElse: () => null);
                      setState(() {
                        this.categoryValue = value;
                        this.categoryCode = key;
                      });
                    },
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
                  DropdownButton(
                    isExpanded: true,
                    value: this.difficultyValue,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      height: 2,
                      color: Color(0XFF364f6b),
                    ),
                    items: widget.difficultyDropDownItems.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        this.difficultyValue = value;
                      });
                    },
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quiz(
                          quizCategoryKey: this.categoryCode,
                          quizDifficulty: this.difficultyValue,
                          quizCategoryValue: this.categoryValue,
                        ),
                      ),
                    );
                  },
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
