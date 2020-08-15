import 'package:html_unescape/html_unescape.dart';

class QuestionAnswers {
  final List<String> questions;
  final List<String> correctAnswers;

  QuestionAnswers({this.questions, this.correctAnswers});

  factory QuestionAnswers.fromJson(Map<dynamic, dynamic> json) {
    var htmlEscape = HtmlUnescape();
    var results = json['results'];
    List<String> questionsList = [];
    List<String> correctAnswersList = [];
    results.forEach((value) {
      questionsList.add(htmlEscape.convert(value['question'].toString()));
      correctAnswersList.add(value['correct_answer'].toString());
    });
    return QuestionAnswers(
      questions: questionsList,
      correctAnswers: correctAnswersList,
    );
  }
}
