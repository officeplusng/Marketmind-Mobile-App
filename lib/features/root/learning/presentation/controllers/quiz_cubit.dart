import 'package:marketmind/features/root/learning/data/dto/quiz_dto.dart';
import 'package:marketmind/features/root/learning/domain/repository/quiz_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/di/injectable.dart';

class StartQuizSuccess extends BaseState<QuizDto> {}

class SubmitQuizSuccess extends BaseState<QuizDto> {}

class QuizCubit extends BaseCubit<QuizDto> {
  QuizCubit() : super(const InitialState()) {
    _repository = getIt<QuizRepository>();
  }

  late QuizRepository _repository;

  Future<void> getQuizByModuleId(int id) async {
    emitLoading();
    final response = await _repository.getQuiz(moduleId: id);
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }

  Future<void> startQuiz({required int moduleId}) async {
    emitLoading();
    final response = await _repository.startQuiz(moduleId: moduleId);
    response.when(onSuccess: (result) {
      emit(StartQuizSuccess());
    }, onError: (error) {
      emitError(error);
    });
  }

  Future<void> answerQuiz(
      {required int moduleId,
      required int quizId,
      required String selectedOption}) async {
    emitLoading();
    final response = await _repository.answerQuiz(
        moduleId: moduleId, quizId: quizId, selectedOption: selectedOption);
    response.when(onSuccess: (result) {
      emit(SubmitQuizSuccess());
    }, onError: (error) {
      emitError(error);
    });
  }
}
