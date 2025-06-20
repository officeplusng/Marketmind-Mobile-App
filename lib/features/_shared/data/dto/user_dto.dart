class UserDto {
  final int? id;
  final String? fullname;
  final String? phone;
  final String? email;
  final String? password;
  final String? role;
  final String? referralCode;
  final String? inviteCode;
  final String? refreshToken;
  final String? timezone;
  final dynamic gettingStarted;
  final Avatar? avatar;
  final dynamic twoFA;
  final bool? autoTimezone;
  final bool? viewHistory;
  final bool? isVerified;
  final bool? isActive;
  final bool? isDeleted;
  final dynamic plan;
  final DateTime? lastLogin;
  final bool? onboarding;

  UserDto({
    this.id,
    this.fullname,
    this.phone,
    this.email,
    this.password,
    this.role,
    this.referralCode,
    this.inviteCode,
    this.refreshToken,
    this.timezone,
    this.gettingStarted,
    this.avatar,
    this.twoFA,
    this.autoTimezone,
    this.viewHistory,
    this.isVerified,
    this.isActive,
    this.isDeleted,
    this.plan,
    this.lastLogin,
    this.onboarding,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      referralCode: json['referralCode'],
      inviteCode: json['inviteCode'],
      refreshToken: json['refreshToken'],
      timezone: json['timezone'],
      gettingStarted: json['gettingStarted'],
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
      twoFA: json['twoFA'],
      autoTimezone: json['autoTimezone'],
      viewHistory: json['viewHistory'],
      isVerified: json['isVerified'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      plan: json['plan'],
      lastLogin: json['lastLogin'] != null ? DateTime.tryParse(json['lastLogin']) : null,
      onboarding: json['onboarding'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'password': password,
      'role': role,
      'referralCode': referralCode,
      'inviteCode': inviteCode,
      'refreshToken': refreshToken,
      'timezone': timezone,
      'gettingStarted': gettingStarted,
      'avatar': avatar?.toJson(),
      'twoFA': twoFA,
      'autoTimezone': autoTimezone,
      'viewHistory': viewHistory,
      'isVerified': isVerified,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'plan': plan,
      'lastLogin': lastLogin?.toIso8601String(),
      'onboarding': onboarding,
    };
  }
}

class Avatar {
  final String? name;
  final String? fieldId;
  final String? url;

  Avatar({
    this.name,
    this.fieldId,
    this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      name: json['name'],
      fieldId: json['fieldId'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fieldId': fieldId,
      'url': url,
    };
  }
}
