class ContactUsDto {
  final String fullname;
  final String email;
  final String title;
  final String description;

  ContactUsDto({
    required this.fullname,
    required this.email,
    required this.title,
    required this.description,
  });

  factory ContactUsDto.fromJson(Map<String, dynamic> json) {
    return ContactUsDto(
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'title': title,
      'description': description,
    };
  }
}
