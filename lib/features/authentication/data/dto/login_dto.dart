class LoginDto {
  final String email;
  final String password;
  final bool isGoogleSignIn;

  LoginDto({
    required this.email,
    required this.password,
    required this.isGoogleSignIn,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      isGoogleSignIn: json['isGoogleSignIn'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'isGoogleSignIn': isGoogleSignIn,
    };
  }
}
