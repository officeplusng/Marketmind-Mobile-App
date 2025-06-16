import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/authentication/data/dto/contact_us_dto.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_sign_up_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_token_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_source.g.dart';

@RestApi(baseUrl: '$apiBaseUrl/auth')
abstract class AuthSource {
  factory AuthSource(Dio dio, {String baseUrl}) = _AuthSource;

  @GET("/register")
  Future<dynamic> register(@Body() RegisterDto dto);

  @GET("/login")
  Future<dynamic> login(@Body() LoginDto dto);

  @GET("/verify-signup")
  Future<dynamic> verifySignUp(@Body() VerifySignUpDto dto);

  @GET("/verify-token")
  Future<dynamic> verifyToken(@Body() VerifyTokenDto dto);

  @GET("/contact-us")
  Future<dynamic> contactUs(@Body() ContactUsDto dto);
}
