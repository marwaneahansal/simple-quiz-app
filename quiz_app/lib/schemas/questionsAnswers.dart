class QuestionAnswers {
  final List<String> questions;
  final List<String> correctAnswers;

  QuestionAnswers({this.questions, this.correctAnswers});

  factory QuestionAnswers.fromJson(Map<dynamic, dynamic> json) {
    var results = json['results'];
    List<String> questionsList = [];
    List<String> correctAnswersList = [];
    results.forEach((value) {
      questionsList.add(value['question']);
      correctAnswersList.add(value['correct_answer']);
    });
    return QuestionAnswers(
      questions: questionsList,
      correctAnswers: correctAnswersList,
    );
  }
}
