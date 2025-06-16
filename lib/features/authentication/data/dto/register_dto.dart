import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String inviteCode;

  RegisterDto({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
    required this.inviteCode,
  });

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
