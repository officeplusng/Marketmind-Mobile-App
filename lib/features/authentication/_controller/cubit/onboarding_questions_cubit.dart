import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/authentication/domain/repositories/onboarding_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_questions_dto.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_answers_dto.dart';

class SubmitOnboardingSuccess extends BaseState<List<OnboardingQuestionDto>> {}
class SubmitOnboardingLoading extends BaseState<List<OnboardingQuestionDto>> {}
class SubmitOnboardingError extends BaseState<List<OnboardingQuestionDto>> {
  String error;
  SubmitOnboardingError(this.error);
}

class OnboardingQuestionsCubit extends BaseCubit<List<OnboardingQuestionDto>> {
  OnboardingQuestionsCubit() : super(const InitialState(data: [])) {
    _repository = getIt<OnboardingRepository>();
  }

  late OnboardingRepository _repository;

  Future<void> fetchOnboardingQuestions() async {
    emitLoading();
    final response = await _repository.fetchOnboardingQuestions();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }

  Future<void> submitOnboardingQuestion(OnboardingAnswerDto body) async {
    emit(SubmitOnboardingLoading());
    final response = await _repository.submitOnboardingQuestion(body);
    response.when(onSuccess: (result) {
      emit(SubmitOnboardingSuccess());
    }, onError: (error) {
      emit(SubmitOnboardingError(error));
    });
  }
}
