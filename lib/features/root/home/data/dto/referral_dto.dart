class ReferralDto {
  final String? name;
  final String? avatar;
  final String? level;
  final int? levelNum;
  final String? joinDate; // Use DateTime? if you want parsed date
  final String? plan;
  final String? status;
  final String? earnings;

  ReferralDto({
    this.name,
    this.avatar,
    this.level,
    this.levelNum,
    this.joinDate,
    this.plan,
    this.status,
    this.earnings,
  });

  factory ReferralDto.fromJson(Map<String, dynamic> json) {
    return ReferralDto(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      level: json['level'] as String?,
      levelNum: json['levelNum'] as int?,
      joinDate: json['joinDate'] as String?,
      plan: json['plan'] as String?,
      status: json['status'] as String?,
      earnings: json['earnings'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (avatar != null) data['avatar'] = avatar;
    if (level != null) data['level'] = level;
    if (levelNum != null) data['levelNum'] = levelNum;
    if (joinDate != null) data['joinDate'] = joinDate;
    if (plan != null) data['plan'] = plan;
    if (status != null) data['status'] = status;
    if (earnings != null) data['earnings'] = earnings;
    return data;
  }
}
