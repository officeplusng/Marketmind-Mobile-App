class CoursePathDto {
  final List<CoursePathItemDto> paths;
  final List<CoursePathStatDto> stats;

  CoursePathDto({
    required this.paths,
    required this.stats,
  });

  factory CoursePathDto.fromJson(Map<String, dynamic> json) {
    return CoursePathDto(
      paths: (json['paths'] as List<dynamic>)
          .map((e) => CoursePathItemDto.fromJson(e))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => CoursePathStatDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'paths': paths.map((e) => e.toJson()).toList(),
    'stats': stats.map((e) => e.toJson()).toList(),
  };
}

class CoursePathItemDto {
  final int courseProgressId;
  final String title;
  final String level;
  final String image;
  final String description;
  final bool isCompleted;
  final int progress;
  final String durationRemaining;

  CoursePathItemDto({
    required this.courseProgressId,
    required this.title,
    required this.level,
    required this.image,
    required this.description,
    required this.isCompleted,
    required this.progress,
    required this.durationRemaining,
  });

  factory CoursePathItemDto.fromJson(Map<String, dynamic> json) {
    return CoursePathItemDto(
      courseProgressId: json['courseProgressId'],
      title: json['title'],
      level: json['level'],
      image: json['image'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      progress: json['progress'],
      durationRemaining: json['durationRemaining'],
    );
  }

  Map<String, dynamic> toJson() => {
    'courseProgressId': courseProgressId,
    'title': title,
    'level': level,
    'image': image,
    'description': description,
    'isCompleted': isCompleted,
    'progress': progress,
    'durationRemaining': durationRemaining,
  };
}

class CoursePathStatDto {
  final String title;
  final dynamic value; // int ("96") or String ("0min")

  CoursePathStatDto({
    required this.title,
    required this.value,
  });

  factory CoursePathStatDto.fromJson(Map<String, dynamic> json) {
    return CoursePathStatDto(
      title: json['title'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'value': value,
  };
}
