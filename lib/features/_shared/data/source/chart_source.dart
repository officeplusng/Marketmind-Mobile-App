import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/chart_dto.dart';
import '../dto/search_dto.dart';

part 'chart_source.g.dart';

@RestApi(baseUrl: aiBaseUrl)
abstract class ChartSource {
  factory ChartSource(Dio dio, {String baseUrl}) = _ChartSource;

  @GET("/forex-intraday")
  Future<ForexTimeSeriesResponse> intraDay(@Query('from_symbol') String fromSymbol,@Query('to_symbol') String toSymbol,@Query('interval') String interval);
  @GET("/fx-daily")
  Future<ForexTimeSeriesResponse> dailyChartData(@Query('from_symbol') String fromSymbol,@Query('to_symbol') String toSymbol);
  @GET("/fx-weekly")
  Future<ForexTimeSeriesResponse> weeklyChartData(@Query('from_symbol') String fromSymbol,@Query('to_symbol') String toSymbol);
  @GET("/fx-monthly")
  Future<ForexTimeSeriesResponse> monthlyChartData(@Query('from_symbol') String fromSymbol,@Query('to_symbol') String toSymbol);

}
