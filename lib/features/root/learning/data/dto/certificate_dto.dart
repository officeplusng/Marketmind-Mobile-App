class CertificateDto {
  final int id;
  final String status;
  final DateTime createdAt;
  final UserInfoDto user;
  final CourseProgressDto courseProgress;

  CertificateDto({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.user,
    required this.courseProgress,
  });

  factory CertificateDto.fromJson(Map<String, dynamic> json) {
    return CertificateDto(
      id: json['id'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      user: UserInfoDto.fromJson(json['user']),
      courseProgress: CourseProgressDto.fromJson(json['courseProgress']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'user': user.toJson(),
    'courseProgress': courseProgress.toJson(),
  };
}

class UserInfoDto {
  final String fullname;

  UserInfoDto({required this.fullname});

  factory UserInfoDto.fromJson(Map<String, dynamic> json) {
    return UserInfoDto(
      fullname: json['fullname'],
    );
  }

  Map<String, dynamic> toJson() => {
    'fullname': fullname,
  };
}

class CourseProgressDto {
  final CourseDto course;

  CourseProgressDto({required this.course});

  factory CourseProgressDto.fromJson(Map<String, dynamic> json) {
    return CourseProgressDto(
      course: CourseDto.fromJson(json['course']),
    );
  }

  Map<String, dynamic> toJson() => {
    'course': course.toJson(),
  };
}

class CourseDto {
  final String title;

  CourseDto({required this.title});

  factory CourseDto.fromJson(Map<String, dynamic> json) {
    return CourseDto(
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
  };
}
