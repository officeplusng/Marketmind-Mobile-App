import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/dto/update_user_dto.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/_shared/data/source/user_source.dart';

@lazySingleton
class UserRepository {
  final UserSource _source;

  UserRepository(this._source);

  Future<ApiResult<UserDto>> getUser() =>
      ApiResultWrapper.wrap(() => _source.getUser());

  Future<ApiResult<dynamic>> deleteUser() =>
      ApiResultWrapper.wrap(() => _source.deleteUser());

  Future<ApiResult<dynamic>> updateUser(UserUpdateDto dto) =>
      ApiResultWrapper.wrap(() => _source.updateUser(dto));
}
