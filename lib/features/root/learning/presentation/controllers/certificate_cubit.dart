import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/learning/data/dto/achievement_dto.dart';
import 'package:marketmind/features/root/learning/domain/repository/achievements_repository.dart';

import '../../data/dto/certificate_dto.dart';

class CertificateCubit extends BaseCubit<List<CertificateDto>> {
  CertificateCubit() : super(InitialState()) {
    _repository = getIt<AchievementsRepository>();
  }

  late AchievementsRepository _repository;

  Future<void> getCertificates() async {
    final response = await _repository.getCertificates();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
