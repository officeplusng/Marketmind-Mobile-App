import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_answers_dto.dart';
part 'onboarding_source.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class OnboardingSource {
  factory OnboardingSource(Dio dio) = _OnboardingSource;

  @GET("/onboarding/questions")
  Future<dynamic> getOnboardingQuestions();

  @POST("/onboarding/answers")
  Future<dynamic> submitOnboardingAnswers(@Body() OnboardingAnswerDto body);
}
