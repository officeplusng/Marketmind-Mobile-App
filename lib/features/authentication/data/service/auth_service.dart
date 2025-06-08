import 'package:dio/dio.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';
@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @GET("/register")
  Future<dynamic> register(RegisterDto dto);
  @GET("/login")
  Future<dynamic> login(LoginDto dto);
}