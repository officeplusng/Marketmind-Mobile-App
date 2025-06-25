import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/_shared/data/dto/chart_dto.dart';
import 'package:marketmind/features/_shared/data/enum/time_frame.dart';
import 'package:marketmind/features/_shared/domain/repo/chart_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class CandleChartCubit extends BaseCubit<Map<String, CandleChartData>> {
  late ChartRepository _repository;

  CandleChartCubit() : super(const InitialState()) {
    _repository = getIt<ChartRepository>();
  }

  void fetchChartData(
      {required String fromSymbol,
      required String toSymbol,
      required TimeFrame timeframe}) async {
    emitLoading();
    final response = await _repository.getForexChartData(
        fromSymbol: fromSymbol, toSymbol: toSymbol, timeframe: timeframe);
    response.when(onSuccess: (value) {
      print('************ ${value.timeSeriesFxDaily?.length}');;
      emitSuccess(data: value.timeSeriesFxDaily ?? {});
    }, onError: (error) {
      emitError(error);
    });
  }
}
