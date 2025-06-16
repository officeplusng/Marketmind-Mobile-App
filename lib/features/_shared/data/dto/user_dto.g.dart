// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      timezone: json['timezone'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      autoTimezone: json['autoTimezone'] as bool,
      viewHistory: json['viewHistory'] as bool,
      isVerified: json['isVerified'] as bool,
      isActive: json['isActive'] as bool,
      onboarding: json['onboarding'] as bool,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'role': instance.role,
      'timezone': instance.timezone,
      'avatar': instance.avatar,
      'autoTimezone': instance.autoTimezone,
      'viewHistory': instance.viewHistory,
      'isVerified': instance.isVerified,
      'isActive': instance.isActive,
      'onboarding': instance.onboarding,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      name: json['name'] as String,
      fieldId: json['fieldId'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'name': instance.name,
      'fieldId': instance.fieldId,
      'url': instance.url,
    };
