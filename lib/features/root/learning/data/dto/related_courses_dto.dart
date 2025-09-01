class RelatedCourseDto {
  final int id;
  final String category;
  final String title;
  final List<String> description;
  final String image;
  final String level;
  final int totalLessons;
  final int totalHours;

  RelatedCourseDto({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.image,
    required this.level,
    required this.totalLessons,
    required this.totalHours,
  });

  factory RelatedCourseDto.fromJson(Map<String, dynamic> json) {
    return RelatedCourseDto(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: List<String>.from(json['description']),
      image: json['image'],
      level: json['level'],
      totalLessons: json['totalLessons'],
      totalHours: json['totalHours'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'title': title,
    'description': description,
    'image': image,
    'level': level,
    'totalLessons': totalLessons,
    'totalHours': totalHours,
  };
}
