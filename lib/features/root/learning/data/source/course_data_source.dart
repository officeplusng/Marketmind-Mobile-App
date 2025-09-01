import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:marketmind/features/authentication/data/dto/onboarding_answers_dto.dart';
part 'course_data_source.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class CourseDataSource {
  factory CourseDataSource(Dio dio) = _CourseDataSource;

  @GET("/courses/registered/{id}")
  Future<dynamic> getRegisteredCourses(@Path("id") String id);

  @GET("/courses/unregistered/{id}")
  Future<dynamic> getUnRegisteredCourses(@Path("id") String id);

  @GET("/courses/related/{id}")
  Future<dynamic> geRelatedCourses(@Path("id") String id);

  @GET("/courses/recommendations")
  Future<dynamic> getCourseRecommendations();

  @GET("/courses/progress")
  Future<dynamic> getAllCoursesProgress();

  @GET("/courses/progress/{id}")
  Future<dynamic> getAllCourseProgress(@Path('id') String id);

  @GET("/courses/paths")
  Future<dynamic> getAllCoursesPath();

  @GET("/courses/stats")
  Future<dynamic> getAllCoursesStat();

  @GET("/courses/ai/new/stats")
  Future<dynamic> getCourseGenerationStatus();
}
