import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/authentication/data/dto/contact_us_dto.dart';
import 'package:marketmind/features/authentication/data/dto/email_dto.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_sign_up_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_token_dto.dart';
import 'package:marketmind/features/authentication/data/source/auth_source.dart';

@lazySingleton
class AuthRepository {
  final AuthSource _source;

  AuthRepository(this._source);

  Future<ApiResult<dynamic>> register(RegisterDto dto) =>
      ApiResultWrapper.wrap(() => _source.register(dto));

  Future<ApiResult<dynamic>> login(LoginDto dto) =>
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
