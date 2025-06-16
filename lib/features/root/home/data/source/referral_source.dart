import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/data/dto/referral_statistics_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'referral_source.g.dart';

@RestApi(baseUrl: '$apiBaseUrl/referrals')
abstract class ReferralSource {
  factory ReferralSource(Dio dio, {String baseUrl}) = _ReferralSource;


  @GET("")
  Future<List<ReferralDto>> getReferrals();
  @GET("/statistics")
  Future<ReferralStatisticsDto> getReferralStatistics();
}
