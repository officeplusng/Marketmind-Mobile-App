import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/base_url.dart';
import '../dto/watch_list_model.dart';
part 'watch_list_source.g.dart';
@RestApi(baseUrl: apiBaseUrl)
abstract class WatchListSource {
  factory WatchListSource(Dio dio, {String baseUrl}) = _WatchListSource;

  @GET("/watchlist")
  Future<List<WatchListModel>> getWatchList();

  @POST('watchlist')
  Future<dynamic> addWatchList(@Body() WatchListModel body);

  @DELETE('watchlist')
  Future<dynamic> delete(@Body() DeleteWatchListModel body);
}
