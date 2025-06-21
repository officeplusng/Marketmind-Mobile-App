import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/data/dto/referral_statistics_dto.dart';
import 'package:marketmind/features/root/home/data/source/referral_source.dart';

@lazySingleton
class ReferralRepository {
  final ReferralSource _source;

  ReferralRepository(this._source);

  Future<ApiResult<ReferralStatisticsDto>> getReferralStatistics() =>
      ApiResultWrapper.wrap(() => _source.getReferralStatistics());
  Future<ApiResult<List<ReferralDto>>> getReferrals() =>
      ApiResultWrapper.wrap(() => _source.getReferrals());
}
