import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/core/network/services/network_core_sevice.dart';

import '../api_result.dart';
import '../data/refresh_token_dto.dart';

@lazySingleton
class NetworkCoreRepository {
  final NetworkCoreService _source;

  NetworkCoreRepository(this._source);

  Future<ApiResult<RefreshTokenDto>> refreshToken(String refreshToken) async {
    return ApiResultWrapper.wrap(() => _source.refreshToken(refreshToken));
  }
}
