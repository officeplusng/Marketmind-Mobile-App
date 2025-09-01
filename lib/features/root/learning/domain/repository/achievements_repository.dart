import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/learning/data/dto/achievement_dto.dart';
import 'package:marketmind/features/root/learning/data/dto/badge_dto.dart';
import 'package:marketmind/features/root/learning/data/dto/certificate_dto.dart';
import 'package:marketmind/features/root/learning/data/source/achievements_data_source.dart';
import 'package:marketmind/core/network/api_result.dart';

@lazySingleton
class AchievementsRepository {
  AchievementsDataSource _source;

  AchievementsRepository(this._source);

  Future<ApiResult<List<AchievementDto>>> getAchievements() async {
    return ApiResultWrapper.wrapList<List<AchievementDto>>(
        func: () => _source.getBadgesCatalogs(),
        mapper: (json) => json.map((e) => AchievementDto.fromJson(e)).toList());
  }

  Future<ApiResult<List<CertificateDto>>> getCertificates() async {
    return ApiResultWrapper.wrapList<List<CertificateDto>>(
        func: () => _source.getCertificates(),
        mapper: (json) => json.map((e) => CertificateDto.fromJson(e)).toList());
  }

  Future<ApiResult<UserBadgesDto>> getBadges() async {
    return ApiResultWrapper.wrapValue<UserBadgesDto>(
        func: () => _source.getBadges(),
        mapper: (json) => UserBadgesDto.fromJson(json));
  }
}
