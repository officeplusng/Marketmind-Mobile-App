import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/_shared/data/dto/update_user_dto.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'user_source.g.dart';

@RestApi(baseUrl: '$apiBaseUrl/users')
abstract class UserSource {
  factory UserSource(Dio dio, {String baseUrl}) = _UserSource;

  @GET("/profile")
  Future<UserDto> getUser();

  @DELETE("")
  Future<dynamic> deleteUser();

  @PATCH("")
  Future<dynamic> updateUser(@Body() UserUpdateDto dto);
}
