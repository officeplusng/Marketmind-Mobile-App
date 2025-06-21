class RegisterDto {
  final String? fullname;
  final String? email;
  final String? phone;
  final String? password;
  final String? inviteCode;

  RegisterDto({
    this.fullname,
    this.email,
    this.phone,
    this.password,
    this.inviteCode,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
      fullname: json['fullname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      inviteCode: json['inviteCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'password': password,
      'inviteCode': inviteCode,
    };
  }

  RegisterDto copyWith({
    String? fullname,
    String? email,
    String? phone,
    String? password,
    String? inviteCode,
  }) {
    return RegisterDto(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      inviteCode: inviteCode ?? this.inviteCode,
    );
  }
}
