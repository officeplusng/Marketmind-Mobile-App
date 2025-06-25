import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/dto/chart_dto.dart';
import 'package:marketmind/features/_shared/data/enum/time_frame.dart';
import 'package:marketmind/features/_shared/data/source/chart_source.dart';

@lazySingleton
class ChartRepository {
  final ChartSource _source;

  ChartRepository(this._source);

  Future<ApiResult<ForexTimeSeriesResponse>> getForexChartData(
      {required String fromSymbol,
      required String toSymbol,
      required TimeFrame timeframe}) async {
    return ApiResultWrapper.wrap(() {
      switch (timeframe) {
        case TimeFrame.daily:
          return _source
              .dailyChartData(fromSymbol, toSymbol);
        case TimeFrame.weekly:
          return _source
              .weeklyChartData(fromSymbol, toSymbol);
        case TimeFrame.monthly:
          return _source
              .monthlyChartData(fromSymbol, toSymbol);
        case TimeFrame.a_1mins:
          return _source
              .intraDay(fromSymbol, toSymbol, '1min');
        case TimeFrame.a_5mins:
          return _source
              .intraDay(fromSymbol, toSymbol, '5min');
        case TimeFrame.a_15mins:
          return _source
              .intraDay(fromSymbol, toSymbol, '15min');
        case TimeFrame.a_30mins:
          return _source
              .intraDay(fromSymbol, toSymbol, '30min');
        case TimeFrame.a_60mins:
          return _source
              .intraDay(fromSymbol, toSymbol, '60min');
      }
    });
  }
}
