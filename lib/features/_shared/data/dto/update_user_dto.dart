import 'package:marketmind/features/_shared/data/dto/user_dto.dart';

class UserUpdateDto {
  String? fullname;
  String? phone;
  String? email;
  String? role;
  String? currentPassword;
  String? newPassword;
  Avatar? avatar;
  bool? autoTimezone;
  bool? viewHistory;
  Map<String, dynamic>? twoFA;
  String? inviteCode;
  List<OnboardingItem>? onboarding;

  UserUpdateDto({
    this.fullname,
    this.phone,
    this.email,
    this.role,
    this.currentPassword,
    this.newPassword,
    this.avatar,
    this.autoTimezone,
    this.viewHistory,
    this.twoFA,
    this.inviteCode,
    this.onboarding,
  });

  factory UserUpdateDto.fromJson(Map<String, dynamic> json) {
    return UserUpdateDto(
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      currentPassword: json['currentPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      avatar:
      json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
      autoTimezone: json['autoTimezone'] as bool?,
      viewHistory: json['viewHistory'] as bool?,
      twoFA: json['twoFA'] as Map<String, dynamic>?,
      inviteCode: json['inviteCode'] as String?,
      onboarding: (json['onboarding'] as List<dynamic>?)
          ?.map((e) => OnboardingItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (fullname != null) data['fullname'] = fullname;
    if (phone != null) data['phone'] = phone;
    if (email != null) data['email'] = email;
    if (role != null) data['role'] = role;
    if (currentPassword != null) data['currentPassword'] = currentPassword;
    if (newPassword != null) data['newPassword'] = newPassword;
    if (avatar != null) data['avatar'] = avatar!.toJson();
    if (autoTimezone != null) data['autoTimezone'] = autoTimezone;
    if (viewHistory != null) data['viewHistory'] = viewHistory;
    if (twoFA != null) data['twoFA'] = twoFA;
    if (inviteCode != null) data['inviteCode'] = inviteCode;
    if (onboarding != null) {
      data['onboarding'] = onboarding!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class OnboardingItem {
  String? question;
  Map<String, dynamic>? response;

  OnboardingItem({this.question, this.response});

  factory OnboardingItem.fromJson(Map<String, dynamic> json) {
    return OnboardingItem(
      question: json['question'] as String?,
      response: json['response'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (question != null) data['question'] = question;
    if (response != null) data['response'] = response;
    return data;
  }
}
