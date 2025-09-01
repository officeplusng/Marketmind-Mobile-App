import 'package:injectable/injectable.dart';
import 'package:marketmind/features/root/learning/data/dto/quiz_dto.dart';
import 'package:marketmind/features/root/learning/data/source/quiz_data_source.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';

@lazySingleton
class QuizRepository {
  QuizDataSource _source;

  QuizRepository(this._source);

  Future<ApiResult<dynamic>> startQuiz({required int moduleId}) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.startQuiz({'moduleId': moduleId}),
        mapper: (json) => json);
  }

  Future<ApiResult<QuizDto>> getQuiz({required int moduleId}) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.getQuizByModule(moduleId.toString()),
        mapper: (json) => QuizDto.fromJson(json));
  }

  Future<ApiResult<dynamic>> answerQuiz(
      {required int moduleId,
      required int quizId,
      required String selectedOption}) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.startQuiz({
              "moduleId": moduleId,
              "quizId": quizId,
              "selectedOption": selectedOption
            }),
        mapper: (json) => json);
  }
}
