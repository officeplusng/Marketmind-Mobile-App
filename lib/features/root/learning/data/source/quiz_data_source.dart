import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'package:marketmind/core/network/base_url.dart';
part 'quiz_data_source.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class QuizDataSource {
  factory QuizDataSource(Dio dio) = _QuizDataSource;

  @POST("/courses/quiz/start")
  Future<dynamic> startQuiz(@Body() Map<String,dynamic> body);
  @POST("/courses/quiz/answer")
  Future<dynamic> answerQuiz(@Body() Map<String,dynamic> body);
  @POST("/courses/quiz/{id}")
  Future<dynamic> getQuizByModule(@Path('id') String id);

}
