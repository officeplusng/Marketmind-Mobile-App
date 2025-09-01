class CourseStatsResponseDto {
  final StatsDto stats;
  final List<String> courseFacts;
  final List<String> courseTips;
  final List<CourseQuizDto> courseQuizzes;

  CourseStatsResponseDto({
    required this.stats,
    required this.courseFacts,
    required this.courseTips,
    required this.courseQuizzes,
  });

  factory CourseStatsResponseDto.fromJson(Map<String, dynamic> json) {
    return CourseStatsResponseDto(
      stats: StatsDto.fromJson(json['stats']),
      courseFacts: List<String>.from(json['courseFacts'] ?? []),
      courseTips: List<String>.from(json['courseTips'] ?? []),
      courseQuizzes: (json['courseQuizzes'] as List<dynamic>? ?? [])
          .map((e) => CourseQuizDto.fromJson(e))
          .toList(),
    );
  }
}

class StatsDto {
  final String phase;
  final String status;
  final String message;
  final int percent;
  final int courseId;
  final DateTime updatedAt;
  final int totalSteps;
  final int currentStep;

  StatsDto({
    required this.phase,
    required this.status,
    required this.message,
    required this.percent,
    required this.courseId,
    required this.updatedAt,
    required this.totalSteps,
    required this.currentStep,
  });

  factory StatsDto.fromJson(Map<String, dynamic> json) {
    return StatsDto(
      phase: json['phase'] ?? '',
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      percent: json['percent'] ?? 0,
      courseId: json['courseId'] ?? 0,
      updatedAt: DateTime.parse(json['updatedAt']),
      totalSteps: json['totalSteps'] ?? 0,
      currentStep: json['currentStep'] ?? 0,
    );
  }
}

class CourseQuizDto {
  final int correct;
  final List<String> options;
  final String question;
  final String explanation;

  CourseQuizDto({
    required this.correct,
    required this.options,
    required this.question,
    required this.explanation,
  });

  factory CourseQuizDto.fromJson(Map<String, dynamic> json) {
    return CourseQuizDto(
      correct: json['correct'] ?? 0,
      options: List<String>.from(json['options'] ?? []),
      question: json['question'] ?? '',
      explanation: json['explanation'] ?? '',
    );
  }
}
