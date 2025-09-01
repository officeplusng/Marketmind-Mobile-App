class CourseProgressDto {
  final int courseProgressId;
  final String title;
  final String image;
  final bool isCompleted;
  final List<CourseStatDto> stats;

  CourseProgressDto({
    required this.courseProgressId,
    required this.title,
    required this.image,
    required this.isCompleted,
    required this.stats,
  });

  factory CourseProgressDto.fromJson(Map<String, dynamic> json) {
    return CourseProgressDto(
      courseProgressId: json['courseProgressId'],
      title: json['title'],
      image: json['image'],
      isCompleted: json['isCompleted'],
      stats: (json['stats'] as List<dynamic>)
          .map((e) => CourseStatDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'courseProgressId': courseProgressId,
    'title': title,
    'image': image,
    'isCompleted': isCompleted,
    'stats': stats.map((e) => e.toJson()).toList(),
  };
}

class CourseStatDto {
  final String title;
  final dynamic value; // can be String ("0/35", "0%", "0min") or int (0)

  CourseStatDto({
    required this.title,
    required this.value,
  });

  factory CourseStatDto.fromJson(Map<String, dynamic> json) {
    return CourseStatDto(
      title: json['title'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'value': value,
  };
}
