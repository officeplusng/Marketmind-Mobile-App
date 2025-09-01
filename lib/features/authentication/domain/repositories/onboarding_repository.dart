import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_questions_dto.dart';
import 'package:marketmind/features/authentication/data/source/onboarding_source.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_answers_dto.dart';

@lazySingleton
class OnboardingRepository {
  OnboardingSource _source;

  OnboardingRepository(this._source);

  Future<ApiResult<List<OnboardingQuestionDto>>>
      fetchOnboardingQuestions() async {
    return ApiResultWrapper.wrapList(
        func: () => _source.getOnboardingQuestions(),
        mapper: (json) =>
            json.map((e) => OnboardingQuestionDto.fromJson(e)).toList());
  }

  Future<ApiResult<dynamic>> submitOnboardingQuestion(
      OnboardingAnswerDto body) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.submitOnboardingAnswers(body),
        mapper: (json) => json);
  }
}
