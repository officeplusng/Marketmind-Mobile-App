class CourseStatDto {
  final int quizCompleted;
  final int quizCompletionRate;
  final int quizCompletionChange;
  final int coursesCompleted;
  final int coursesCompletedChange;
  final int certificatesEarned;

  CourseStatDto({
    required this.quizCompleted,
    required this.quizCompletionRate,
    required this.quizCompletionChange,
    required this.coursesCompleted,
    required this.coursesCompletedChange,
    required this.certificatesEarned,
  });

  factory CourseStatDto.fromJson(Map<String, dynamic> json) {
    return CourseStatDto(
      quizCompleted: json['quizCompleted'],
      quizCompletionRate: json['quizCompletionRate'],
      quizCompletionChange: json['quizCompletionChange'],
      coursesCompleted: json['coursesCompleted'],
      coursesCompletedChange: json['coursesCompletedChange'],
      certificatesEarned: json['certificatesEarned'],
    );
  }

  Map<String, dynamic> toJson() => {
    'quizCompleted': quizCompleted,
    'quizCompletionRate': quizCompletionRate,
    'quizCompletionChange': quizCompletionChange,
    'coursesCompleted': coursesCompleted,
    'coursesCompletedChange': coursesCompletedChange,
    'certificatesEarned': certificatesEarned,
  };
}
