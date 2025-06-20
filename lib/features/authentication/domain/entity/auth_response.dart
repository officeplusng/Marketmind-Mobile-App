import '../../../_shared/data/dto/user_dto.dart';

class AuthResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? email;
  final int? id;
  final String? role;
  final String? fullname;
  final String? phone;
  final String? referralCode;
  final String? timezone;
  final Avatar? avatar;
  final bool? autoTimezone;
  final bool? viewHistory;
  final Plan? plan;
  final GettingStarted? gettingStarted;
  final String? message;

  UserDto toUserDto() {
    return UserDto(
      id: id ?? 0,
      email: email ?? '',
      fullname: fullname ?? '',
      phone: phone ?? '',
      role: role ?? '',
      timezone: timezone ?? '',
      avatar: avatar != null
          ? Avatar(
              name: avatar?.url.split('/').last ?? '',
              fieldId: '', // Default or extract if available
              url: avatar?.url ?? '',
            )
          : Avatar(name: '', fieldId: '', url: ''),
      autoTimezone: autoTimezone ?? false,
      viewHistory: viewHistory ?? false,
      isVerified: true,
      // hardcoded or extract from a field if available
      isActive: true,
      // hardcoded or extract from a field if available
      onboarding: gettingStarted?.isCompleteProfile ?? false,
    );
  }

  AuthResponse({
    this.accessToken,
    this.refreshToken,
    this.email,
    this.id,
    this.role,
    this.fullname,
    this.phone,
    this.referralCode,
    this.timezone,
    this.avatar,
    this.autoTimezone,
    this.viewHistory,
    this.plan,
    this.gettingStarted,
    this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      email: json['email'],
      id: json['id'],
      role: json['role'],
      fullname: json['fullname'],
      phone: json['phone'],
      referralCode: json['referralCode'],
      timezone: json['timezone'],
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
      autoTimezone: json['autoTimezone'],
      viewHistory: json['viewHistory'],
      plan: json['plan'] != null ? Plan.fromJson(json['plan']) : null,
      gettingStarted: json['gettingStarted'] != null
          ? GettingStarted.fromJson(json['gettingStarted'])
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'email': email,
      'id': id,
      'role': role,
      'fullname': fullname,
      'phone': phone,
      'referralCode': referralCode,
      'timezone': timezone,
      'avatar': avatar?.toJson(),
      'autoTimezone': autoTimezone,
      'viewHistory': viewHistory,
      'plan': plan?.toJson(),
      'gettingStarted': gettingStarted?.toJson(),
      'message': message,
    };
  }
}

class Plan {
  final String? name;
  final String? status;
  final int? amount;
  final int? duration;

  Plan({this.name, this.status, this.amount, this.duration});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      name: json['name'],
      status: json['status'],
      amount: json['amount'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'amount': amount,
      'duration': duration,
    };
  }
}

class GettingStarted {
  final int? count;
  final bool? isCompleteProfile;
  final bool? isWatchlist;
  final bool? isPlatformOverview;

  GettingStarted({
    this.count,
    this.isCompleteProfile,
    this.isWatchlist,
    this.isPlatformOverview,
  });

  factory GettingStarted.fromJson(Map<String, dynamic> json) {
    return GettingStarted(
      count: json['count'],
      isCompleteProfile: json['isCompleteProfile'],
      isWatchlist: json['isWatchlist'],
      isPlatformOverview: json['isPlatformOverview'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'isCompleteProfile': isCompleteProfile,
      'isWatchlist': isWatchlist,
      'isPlatformOverview': isPlatformOverview,
    };
  }
}
