import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/learning/data/dto/course_path_dto.dart';
import 'package:marketmind/features/root/learning/data/source/course_data_source.dart';
import 'package:marketmind/features/root/learning/data/dto/course_progress_dto.dart';
import 'package:marketmind/features/root/learning/data/dto/course_generation_progress_dto.dart';

@lazySingleton
class CoursesRepository {
  CourseDataSource _source;

  CoursesRepository(this._source);

  Future<ApiResult<List<CourseProgressDto>>> getCourseProgress() async {
    return ApiResultWrapper.wrapList(
        func: () => _source.getAllCoursesProgress(),
        mapper: (json) {
          return json.map((e) => CourseProgressDto.fromJson(e)).toList();
        });
  }

  Future<ApiResult<CoursePathDto>> getCoursePath() async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.getAllCoursesPath(),
        mapper: (json) {
          return CoursePathDto.fromJson(json);
        });
  }

  Future<ApiResult<CourseStatDto>> getCourseStat() async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.getAllCoursesStat(),
        mapper: (json) {
          return CourseStatDto.fromJson(json);
        });
  }

  Future<ApiResult<CourseStatsResponseDto>> getCourseGenerationStatus() async {
    return ApiResultWrapper.wrapValue(
        func: () => _source.getCourseGenerationStatus(),
        mapper: (json) => CourseStatsResponseDto.fromJson(json));
  }
}
