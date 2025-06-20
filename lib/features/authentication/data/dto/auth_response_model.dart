import 'package:marketmind/features/authentication/domain/entity/auth_response.dart';

class AuthResponseModel extends AuthResponse {
  AuthResponseModel(
      {required super.accessToken,
      required super.refreshToken,
      required super.email,
      required super.id,
      required super.role,
      required super.fullname,
      required super.phone,
      required super.referralCode,
      required super.timezone,
      required super.autoTimezone,
      required super.viewHistory,
      super.avatar,
      super.gettingStarted,
      super.plan,
      required super.message});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      email: json['email'],
      id: json['id'],
      role: json['role'],
      fullname: json['fullname'],
      phone: json['phone'],
      referralCode: json['referralCode'],
      timezone: json['timezone'],
      avatar: json['avatar'],
      autoTimezone: json['autoTimezone'],
      viewHistory: json['viewHistory'],
      plan: json['plan'],
      gettingStarted: json['gettingStarted'],
      message: json['message'],
    );
  }

  factory AuthResponseModel.fromEntity(AuthResponse entity) {
    return AuthResponseModel(
        accessToken: entity.accessToken,
        refreshToken: entity.referralCode,
        email: entity.email,
        id: entity.id,
        role: entity.role,
        fullname: entity.fullname,
        phone: entity.phone,
        referralCode: entity.referralCode,
        timezone: entity.timezone,
        autoTimezone: entity.autoTimezone,
        viewHistory: entity.viewHistory,
        message: '');
  }
}
