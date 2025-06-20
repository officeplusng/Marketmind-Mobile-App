class LoginDto {
  final String email;
  final String password;
  final bool isGoogleSignIn;

  LoginDto({
    required this.email,
    required this.password,
    required this.isGoogleSignIn,
  });


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
    };
  }
}
