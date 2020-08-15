import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetStyles {
  static TextStyle labelTextStyle = new TextStyle(
    fontSize: 20,
  );

  static Widget answerBtn(
      {BuildContext context, String text, Function pressedFunc}) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      onPressed: () {
        pressedFunc();
      },
      color: Color(0xFF21e6c1),
      textColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget questionIndicator({BuildContext context}) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8,
            width: MediaQuery.of(context).size.width / 10,
            color: Colors.deepPurple,
          ),
          Expanded(
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static Widget questionsWidget({BuildContext context, String question}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            question,
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
            ),
            WidgetStyles.answerBtn(
              context: context,
              text: 'false',
            ),
          ],
        ),
      ],
    );
  }
}
