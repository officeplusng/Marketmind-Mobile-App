import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/data/dto/referral_statistics_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/local/secured_storage_service.dart';

class ReferralListSource {
  Dio? dio;
  String? baseUrl;

  ReferralListSource(this.dio, {this.baseUrl});

  Future<ApiResult<List<ReferralDto>>> getReferrals() async {
    if (dio == null) {
      return const Success(data: []);
    }
    try {
      final dio = Dio();
      final _secureStorageService = getIt<SecureStorageService>();
      String? token = await _secureStorageService.getToken();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get<dynamic>('${apiBaseUrl}referrals');
      if (response.statusCode == 200) {
        return Success(
            data: (response.data as List)
                .map((e) => ReferralDto.fromJson(e))
                .toList());
      }
      return Failure(error: 'Failed to fetch referrals');
    } catch (e) {
      return Failure(error: e.toString());
    }
  }
}
