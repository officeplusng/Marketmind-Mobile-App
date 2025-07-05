class RefreshTokenDto {
  final String? email;
  final String? accessToken;
  final String? refreshToken;
  final String? role;
  final int? id;
  final String? message;

  RefreshTokenDto({
    this.email,
    this.accessToken,
    this.refreshToken,
    this.role,
    this.id,
    this.message,
  });

  factory RefreshTokenDto.fromJson(Map<String, dynamic> json) {
    return RefreshTokenDto(
      email: json['email'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      role: json['role'],
      id: json['id'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'role': role,
      'id': id,
      'message': message,
    };
  }

  RefreshTokenDto copyWith({
    String? email,
    String? accessToken,
    String? refreshToken,
    String? role,
    int? id,
    String? message,
  }) {
    return RefreshTokenDto(
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      role: role ?? this.role,
      id: id ?? this.id,
      message: message ?? this.message,
    );
  }
}
