import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  final String email;
  final String fullname;
  final String phone;
  final String role;
  final String timezone;
  final Avatar avatar;
  final bool autoTimezone;
  final bool viewHistory;
  final bool isVerified;
  final bool isActive;
  final bool onboarding;

  UserDto({
    required this.id,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.role,
    required this.timezone,
    required this.avatar,
    required this.autoTimezone,
    required this.viewHistory,
    required this.isVerified,
    required this.isActive,
    required this.onboarding,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class Avatar {
  final String name;
  final String fieldId;
  final String url;

  Avatar({
    required this.name,
    required this.fieldId,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
