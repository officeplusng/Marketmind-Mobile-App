import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/learning/data/dto/achievement_dto.dart';
import 'package:marketmind/features/root/learning/domain/repository/achievements_repository.dart';

class AchievementsCubit extends BaseCubit<List<AchievementDto>> {
  AchievementsCubit() : super(const InitialState()) {
    _repository = getIt<AchievementsRepository>();
  }

  late AchievementsRepository _repository;

  Future<void> getAchievements() async {
    final response = await _repository.getAchievements();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
