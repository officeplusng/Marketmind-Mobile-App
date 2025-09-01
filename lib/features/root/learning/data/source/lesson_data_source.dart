import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'lesson_data_source.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class LessonsDataSource {
  factory LessonsDataSource(Dio dio) = _LessonsDataSource;

  @POST("/courses/lesson/open")
  Future<dynamic> openLesson(@Body() Map<String,dynamic> body);
  @POST("/courses/lesson/watch")
  Future<dynamic> watchLesson(@Body() Map<String,dynamic> body);
  @POST("/courses/lesson/complete")
  Future<dynamic> completeLesson(@Body() Map<String,dynamic> body);

}
