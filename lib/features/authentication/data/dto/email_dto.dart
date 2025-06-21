class EmailDto{
  final String email;
  const EmailDto({required this.email});

  Map<String,dynamic> toJson() => {
    'email':email
  };
}class OAuthTokenDto{
  final String token;
  const OAuthTokenDto({required this.token});

  Map<String,dynamic> toJson() => {
    'idToken':token
  };
}