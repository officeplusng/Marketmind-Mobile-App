import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_data_dto.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';

import '../../data/source/trading_insight_source.dart';

@lazySingleton
class TradingInsightRepository {
  final TradingInsightSource _source;

  TradingInsightRepository(this._source);

  Future<ApiResult<List<TradingInsightDto>>> fetchTradingInsight() async {
    return ApiResultWrapper.wrap(() async {
      await Future.delayed(Duration(seconds: 3));
      return TradingInsightDto.dummyTradingInsights;
    });
  }

  Future<ApiResult<MarketAnalysisData>> fetchInsightData(
      List<String> watchlist) async {
    return ApiResultWrapper.wrap(() => _source.getTradingInsight(
        symbols: watchlist.join(','),
        timeframe: '60min',
        signalMode: 'enhanced'));
  }
}
