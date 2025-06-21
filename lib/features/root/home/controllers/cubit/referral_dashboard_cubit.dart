import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/home/domain/repository/referral_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../data/dto/referral_statistics_dto.dart';

class ReferralDashboardCubit extends BaseCubit<ReferralStatisticsDto> {
  late ReferralRepository _repository;

  ReferralDashboardCubit() : super(InitialState()) {
    _repository = getIt<ReferralRepository>();
  }

  void fetchReferralStatistics() async {
    emitLoading();
    final response = await _repository.getReferralStatistics();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
