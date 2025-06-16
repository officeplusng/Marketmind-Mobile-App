class VerifyTokenDto {
  final String email;
  final String token;
  final String password;
  final String confirmPassword;

  VerifyTokenDto({
    required this.email,
    required this.token,
    required this.password,
    required this.confirmPassword,
  });

  factory VerifyTokenDto.fromJson(Map<String, dynamic> json) {
    return VerifyTokenDto(
      email: json['email'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
