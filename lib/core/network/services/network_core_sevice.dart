import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/core/network/data/refresh_token_dto.dart';
import 'package:retrofit/retrofit.dart';


part 'network_core_sevice.g.dart';


@RestApi(baseUrl: aiBaseUrl)
abstract class NetworkCoreService {
  factory NetworkCoreService(Dio dio, {String baseUrl}) = _NetworkCoreService;

  @GET("/refresh-token")
  Future<RefreshTokenDto> refreshToken(@Path()String refreshToken);

}
