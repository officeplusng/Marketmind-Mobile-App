class OnboardingAnswerDto {
  final int userId;
  final List<AnswerDto> answers;

  OnboardingAnswerDto({
    required this.userId,
    required this.answers,
  });

  factory OnboardingAnswerDto.fromJson(Map<String, dynamic> json) {
    return OnboardingAnswerDto(
      userId: json['userId'],
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'answers': answers.map((e) => e.toJson()).toList(),
      };
}

class AnswerDto {
  final int questionId;
  final List<String> response;

  AnswerDto({
    required this.questionId,
    required this.response,
  });

 static  List<AnswerDto> fromMap(Map<int, List<String>> answers) {
    List<AnswerDto> answerList = [];
    answers.forEach((key, value) {
      answerList.add(AnswerDto(questionId: key, response: value));
    });
    return answerList;
  }

  factory AnswerDto.fromJson(Map<String, dynamic> json) {
    return AnswerDto(
      questionId: json['questionId'],
      response: List<String>.from(json['response']),
    );
  }

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'response': response,
      };
}
