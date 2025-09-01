import 'package:marketmind/features/root/learning/domain/repository/lesson_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/di/injectable.dart';

class LessonCubit extends BaseCubit<dynamic> {
  LessonCubit() : super(const InitialState()) {
    _repository = getIt<LessonRepository>();
  }

  late LessonRepository _repository;

  Future<void> openLesson(int lessonProgressId) async {
    emitLoading();
    final response = await _repository.openLesson(lessonProgressId);
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }

  Future<void> completeLesson(int lessonProgressId) async {
    emitLoading();
    final response = await _repository.completeLesson(lessonProgressId);
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }

  Future<void> watch(int lessonProgressId, int percentage) async {
    emitLoading();
    final response = await _repository.watch(lessonProgressId, percentage);
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
