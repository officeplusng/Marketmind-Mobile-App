import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/learning/domain/repository/achievements_repository.dart';
import 'package:marketmind/features/root/learning/data/dto/badge_dto.dart';

class UserBadgeCubit extends BaseCubit<UserBadgesDto> {
  UserBadgeCubit() : super(InitialState()) {
    _repository = getIt<AchievementsRepository>();
  }

  late AchievementsRepository _repository;

  Future<void> getBadges() async {
    final response = await _repository.getBadges();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
