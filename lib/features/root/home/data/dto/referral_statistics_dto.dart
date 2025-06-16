class ReferralStatisticsDto {
  final ReferralMetric? totalReferrals;
  final ReferralMetric? activeSubscriptions;
  final ReferralMetric? pendingPayout;
  final ReferralMetric? totalEarned;
  final Map<String, int>? earningsByLevel;
  final List<EarningOverTime>? earningsOverTime;

  ReferralStatisticsDto({
    this.totalReferrals,
    this.activeSubscriptions,
    this.pendingPayout,
    this.totalEarned,
    this.earningsByLevel,
    this.earningsOverTime,
  });

  factory ReferralStatisticsDto.fromJson(Map<String, dynamic> json) {
    return ReferralStatisticsDto(
      totalReferrals: json['totalReferrals'] != null
          ? ReferralMetric.fromJson(json['totalReferrals'])
          : null,
      activeSubscriptions: json['activeSubscriptions'] != null
          ? ReferralMetric.fromJson(json['activeSubscriptions'])
          : null,
      pendingPayout: json['pendingPayout'] != null
          ? ReferralMetric.fromJson(json['pendingPayout'])
          : null,
      totalEarned: json['totalEarned'] != null
          ? ReferralMetric.fromJson(json['totalEarned'])
          : null,
      earningsByLevel: (json['earningsByLevel'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, v as int)),
      earningsOverTime: (json['earningsOverTime'] as List<dynamic>?)
          ?.map((e) => EarningOverTime.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (totalReferrals != null) data['totalReferrals'] = totalReferrals!.toJson();
    if (activeSubscriptions != null) data['activeSubscriptions'] = activeSubscriptions!.toJson();
    if (pendingPayout != null) data['pendingPayout'] = pendingPayout!.toJson();
    if (totalEarned != null) data['totalEarned'] = totalEarned!.toJson();
    if (earningsByLevel != null) data['earningsByLevel'] = earningsByLevel;
    if (earningsOverTime != null) {
      data['earningsOverTime'] = earningsOverTime!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ReferralMetric {
  final dynamic value; // Can be int or string
  final int? changeValue;
  final String? changeDirection;

  ReferralMetric({
    this.value,
    this.changeValue,
    this.changeDirection,
  });

  factory ReferralMetric.fromJson(Map<String, dynamic> json) {
    return ReferralMetric(
      value: json['value'],
      changeValue: json['changeValue'] as int?,
      changeDirection: json['changeDirection'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (value != null) data['value'] = value;
    if (changeValue != null) data['changeValue'] = changeValue;
    if (changeDirection != null) data['changeDirection'] = changeDirection;
    return data;
  }
}

class EarningOverTime {
  final String? date;
  final int? value;

  EarningOverTime({
    this.date,
    this.value,
  });

  factory EarningOverTime.fromJson(Map<String, dynamic> json) {
    return EarningOverTime(
      date: json['date'] as String?,
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (date != null) data['date'] = date;
    if (value != null) data['value'] = value;
    return data;
  }
}
