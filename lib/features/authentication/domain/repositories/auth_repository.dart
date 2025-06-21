import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/authentication/data/dto/auth_response_model.dart';
import 'package:marketmind/features/authentication/data/dto/contact_us_dto.dart';
import 'package:marketmind/features/authentication/data/dto/email_dto.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_sign_up_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_token_dto.dart';
import 'package:marketmind/features/authentication/data/source/auth_source.dart';
import 'package:marketmind/features/authentication/domain/entity/auth_response.dart';

@lazySingleton
class AuthRepository {
  final AuthSource _source;

  AuthRepository(this._source);

  Future<ApiResult<AuthResponse>> register(RegisterDto dto) =>
      ApiResultWrapper.wrap(() => _source.register(dto));
  Future<ApiResult<AuthResponse>> googleSignIn(OAuthTokenDto dto) =>
      ApiResultWrapper.wrap(() => _source.googleSignIn(dto));
  Future<ApiResult<AuthResponse>> appleSignIn(OAuthTokenDto dto) =>
      ApiResultWrapper.wrap(() => _source.appleSignIn(dto));

  Future<ApiResult<AuthResponse>> login(LoginDto dto) =>
      ApiResultWrapper.wrap(() => _source.login(dto));

  Future<ApiResult<dynamic>> verifySignUp(VerifySignUpDto dto) =>
      ApiResultWrapper.wrap(() => _source.verifySignUp(dto));

  Future<ApiResult<dynamic>> verifyToken(VerifyTokenDto dto) =>
      ApiResultWrapper.wrap(() => _source.verifyToken(dto));

  Future<ApiResult<dynamic>> contactUs(ContactUsDto dto) =>
      ApiResultWrapper.wrap(() => _source.contactUs(dto));
   Future<ApiResult<dynamic>> resendEmail(EmailDto dto) =>
      ApiResultWrapper.wrap(() => _source.resendEmail(dto));

}
