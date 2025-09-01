import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/learning/data/source/lesson_data_source.dart';

@lazySingleton
class LessonRepository {
  LessonsDataSource _source;

  LessonRepository(this._source);

  Future<ApiResult<dynamic>> openLesson(int lessonProgressId) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.openLesson({'lessonProgressId': lessonProgressId}),
        mapper: (json) => json);
  }

  Future<ApiResult<dynamic>> completeLesson(int lessonProgressId) async {
    return ApiResultWrapper.wrapValue(
        func: () =>
            _source.completeLesson({'lessonProgressId': lessonProgressId}),
        mapper: (json) => json);
  }

  Future<ApiResult<dynamic>> watch(int lessonProgressId, int percentage) async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.watchLesson(
            {'lessonProgressId': lessonProgressId, 'pct': percentage}),
        mapper: (json) => json);
  }
}
