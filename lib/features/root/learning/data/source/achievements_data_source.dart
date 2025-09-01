import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:marketmind/core/network/base_url.dart';
part 'achievements_data_source.g.dart';


@RestApi(baseUrl: apiBaseUrl)
abstract class AchievementsDataSource {
  factory AchievementsDataSource(Dio dio) = _AchievementsDataSource;

  @GET("/achievements/badges/catalogs")
  Future<dynamic> getBadgesCatalogs();

  @GET("/achievements/badges")
  Future<dynamic> getBadges();

  @GET("/achievements/certificates")
  Future<dynamic> getCertificates();

  @GET("/achievements/certificates/{id}")
  Future<dynamic> getCertificateById(@Path('id') String id);
}
