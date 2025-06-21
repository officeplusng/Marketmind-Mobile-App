import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';
import 'package:marketmind/features/root/home/domain/repository/trading_insight_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../data/dto/trading_insight_data_dto.dart';

class TradingInsightCubit extends BaseCubit<List<TradingInsightDto>> {
  late TradingInsightRepository _repository;

  TradingInsightCubit() : super(InitialState()) {
    _repository = getIt<TradingInsightRepository>();
  }

  void fetchTradingInsight() async {
    emitLoading();
    final result = await _repository.fetchTradingInsight();
    result.when(onSuccess: (data) {
      emitSuccess(data: data);
    }, onError: (error) {
      emitError(error);
    });
    // if (result is Success<List<TradingInsightDto>>) {
    //   emitSuccess(data: result.data);
    // }
    // if(result is Failure<List<TradingInsightDto>>){
    //   emitError(result.error);
    // }
  }
}

class AiInsightCubit extends BaseCubit<MarketAnalysisData> {
  late TradingInsightRepository _repository;

  AiInsightCubit() : super(InitialState()) {
    _repository = getIt<TradingInsightRepository>();
  }

  void generateAISpotLight() async {
    final assets = ['BTCUSD','ETHUSD', 'EURUSD', 'GBPUSD', 'USDJPY', 'CADJPY', 'USDCAD', 'USDCHF'];
    emitLoading();
    final result = await _repository.fetchInsightData(assets);
    result.when(onSuccess: (data) {
      emitSuccess(data: data);
    }, onError: (error) {
      emitError(error);
    });
  }
}
