class AchievementDto {
  final int id;
  final String key;
  final String title;
  final String description;
  final String category;
  final String level;
  final String icon;
  final CriteriaDto criteria;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  AchievementDto({
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    required this.icon,
    required this.criteria,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AchievementDto.fromJson(Map<String, dynamic> json) {
    return AchievementDto(
      id: json['id'],
      key: json['key'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      level: json['level'],
      icon: json['icon'],
      criteria: CriteriaDto.fromJson(json['criteria']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'title': title,
    'description': description,
    'category': category,
    'level': level,
    'icon': icon,
    'criteria': criteria.toJson(),
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class CriteriaDto {
  final String type;
  final String level;
  final String category;
  final int minAvgQuiz;
  final int minCompletion;

  CriteriaDto({
    required this.type,
    required this.level,
    required this.category,
    required this.minAvgQuiz,
    required this.minCompletion,
  });

  factory CriteriaDto.fromJson(Map<String, dynamic> json) {
    return CriteriaDto(
      type: json['type'],
      level: json['level'],
      category: json['category'],
      minAvgQuiz: json['minAvgQuiz'],
      minCompletion: json['minCompletion'],
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'level': level,
    'category': category,
    'minAvgQuiz': minAvgQuiz,
    'minCompletion': minCompletion,
  };
}
