import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/network/base_url.dart';
import '../dto/trading_insight_data_dto.dart';

part 'trading_insight_source.g.dart';
@RestApi(baseUrl: aiBaseUrl)
abstract class TradingInsightSource {
  factory TradingInsightSource(Dio dio, {String baseUrl}) = _TradingInsightSource;

  @GET("/ai-insights-fixed")
  Future<MarketAnalysisData> getTradingInsight(
      {
    @Query("symbols") required String symbols,
    @Query("timeframe") required String timeframe,
    @Query("signal_mode") required String signalMode,
  });

}
