/*
{
  "token": "string"
}
 */
class VerifySignUpDto {
  final String token;

  const VerifySignUpDto({required this.token});

  Map<String, dynamic> toJson() => {'token': token};
}
