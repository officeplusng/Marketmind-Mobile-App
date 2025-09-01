class UserBadgesDto {
  final List<BadgeDto> earned;
  final List<BadgeDto> inProgress;

  UserBadgesDto({
    required this.earned,
    required this.inProgress,
  });

  factory UserBadgesDto.fromJson(Map<String, dynamic> json) {
    return UserBadgesDto(
      earned: (json['earned'] as List<dynamic>)
          .map((e) => BadgeDto.fromJson(e))
          .toList(),
      inProgress: (json['inProgress'] as List<dynamic>)
          .map((e) => BadgeDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'earned': earned.map((e) => e.toJson()).toList(),
    'inProgress': inProgress.map((e) => e.toJson()).toList(),
  };
}

class BadgeDto {
  final int id;
  final String key;
  final String title;
  final String description;
  final String category;
  final String level;
  final String image;
  final bool isActive;
  final int progress;
  final int total;
  final DateTime? earnedAt; // nullable

  BadgeDto({
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    required this.image,
    required this.isActive,
    required this.progress,
    required this.total,
    this.earnedAt,
  });

  factory BadgeDto.fromJson(Map<String, dynamic> json) {
    return BadgeDto(
      id: json['id'],
      key: json['key'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      level: json['level'],
      image: json['image'],
      isActive: json['isActive'],
      progress: json['progress'],
      total: json['total'],
      earnedAt:
      json['earnedAt'] != null ? DateTime.parse(json['earnedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'title': title,
    'description': description,
    'category': category,
    'level': level,
    'image': image,
    'isActive': isActive,
    'progress': progress,
    'total': total,
    'earnedAt': earnedAt?.toIso8601String(),
  };
}
