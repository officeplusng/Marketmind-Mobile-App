import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/authentication/data/dto/auth_response_model.dart';
import 'package:marketmind/features/authentication/data/dto/contact_us_dto.dart';
import 'package:marketmind/features/authentication/data/dto/email_dto.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_sign_up_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_token_dto.dart';
import 'package:marketmind/features/authentication/domain/entity/auth_response.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_source.g.dart';

@RestApi(baseUrl: '$apiBaseUrl/auth')
abstract class AuthSource {
  factory AuthSource(Dio dio, {String baseUrl}) = _AuthSource;

  @POST("/register")
  Future<AuthResponse> register(@Body() RegisterDto dto);

  @POST("/login")
  Future<AuthResponse> login(@Body() LoginDto dto);

  @POST("/verify-signup")
  Future<dynamic> verifySignUp(@Body() VerifySignUpDto dto);

  @POST("/verify-token")
  Future<dynamic> verifyToken(@Body() VerifyTokenDto dto);

  @POST("/resend-email")
  Future<dynamic> resendEmail(@Body() EmailDto dto);
  @POST("/contact-us")
  Future<dynamic> contactUs(@Body() ContactUsDto dto);
}
