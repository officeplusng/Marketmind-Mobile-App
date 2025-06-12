import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';

@lazySingleton
class TradingInsightRepository {
  Future<ApiResult<List<TradingInsightDto>>> fetchTradingInsight() async {
    return ApiResultWrapper.wrap(() async {
      await Future.delayed(Duration(seconds: 3));
      return TradingInsightDto.dummyTradingInsights;
    });
  }
}
