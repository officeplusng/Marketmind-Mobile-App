class QuizDto {
  final int moduleId;
  final int quizDurationSecs;
  final bool isStarted;
  final String difficulty;
  final String title;
  final bool completed;
  final int score;
  final int totalQuestions;
  final QuizSessionDto session;
  final QuizCourseDto course;
  final List<QuizQuestionDto> questions;

  QuizDto({
    required this.moduleId,
    required this.quizDurationSecs,
    required this.isStarted,
    required this.difficulty,
    required this.title,
    required this.completed,
    required this.score,
    required this.totalQuestions,
    required this.session,
    required this.course,
    required this.questions,
  });

  factory QuizDto.fromJson(Map<String, dynamic> json) {
    return QuizDto(
      moduleId: json['moduleId'],
      quizDurationSecs: json['quizDurationSecs'],
      isStarted: json['isStarted'],
      difficulty: json['difficulty'],
      title: json['title'],
      completed: json['completed'],
      score: json['score'],
      totalQuestions: json['totalQuestions'],
      session: QuizSessionDto.fromJson(json['session']),
      course: QuizCourseDto.fromJson(json['course']),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestionDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'moduleId': moduleId,
    'quizDurationSecs': quizDurationSecs,
    'isStarted': isStarted,
    'difficulty': difficulty,
    'title': title,
    'completed': completed,
    'score': score,
    'totalQuestions': totalQuestions,
    'session': session.toJson(),
    'course': course.toJson(),
    'questions': questions.map((e) => e.toJson()).toList(),
  };
}

class QuizSessionDto {
  final int id;
  final DateTime startedAt;
  final DateTime expiresAt;
  final bool completed;

  QuizSessionDto({
    required this.id,
    required this.startedAt,
    required this.expiresAt,
    required this.completed,
  });

  factory QuizSessionDto.fromJson(Map<String, dynamic> json) {
    return QuizSessionDto(
      id: json['id'],
      startedAt: DateTime.parse(json['startedAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'startedAt': startedAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
    'completed': completed,
  };
}

class QuizCourseDto {
  final bool completed;

  QuizCourseDto({required this.completed});

  factory QuizCourseDto.fromJson(Map<String, dynamic> json) {
    return QuizCourseDto(
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() => {
    'completed': completed,
  };
}

class QuizQuestionDto {
  final int id;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String explanation;
  final String userAnswer;
  final bool isCorrect;
  final int attemptNumber;

  QuizQuestionDto({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    required this.userAnswer,
    required this.isCorrect,
    required this.attemptNumber,
  });

  factory QuizQuestionDto.fromJson(Map<String, dynamic> json) {
    return QuizQuestionDto(
      id: json['id'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      explanation: json['explanation'],
      userAnswer: json['userAnswer'],
      isCorrect: json['isCorrect'],
      attemptNumber: json['attemptNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'options': options,
    'correctAnswer': correctAnswer,
    'explanation': explanation,
    'userAnswer': userAnswer,
    'isCorrect': isCorrect,
    'attemptNumber': attemptNumber,
  };
}
