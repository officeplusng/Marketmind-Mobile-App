import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/search_dto.dart';

part 'search_asset_source.g.dart';

@RestApi(baseUrl: aiBaseUrl)
abstract class SearchAssetSource {
  factory SearchAssetSource(Dio dio, {String baseUrl}) = _SearchAssetSource;

  @GET("/stock/search")
  Future<SearchResponse> searchStock(@Query('keywords') String keyword);
  @GET("/crypto/search")
  Future<SearchResponse> searchCrypto(@Query('keywords') String keyword);
  @GET("/forex/search")
  Future<SearchResponse> searchForex(@Query('keywords') String keyword);

}
