import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/dto/update_user_dto.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/_shared/data/source/user_source.dart';

@lazySingleton
class UserRepository {
  final UserSource _source;
  final SecureStorageService _storageService;

  UserRepository(this._source, this._storageService);

  Future<ApiResult<UserDto>> getUser() =>
      ApiResultWrapper.wrap(() => _source.getUser());

  Future<ApiResult<UserDto>> getLoggedInUser() async {
    final userString = await _storageService.get(StorageKeys.userDetails);
    if (userString == null) {
      return const Failure(error: 'User not found');
    }
    final userJson = jsonDecode(userString) as Map<String, dynamic>;
    return Success(data: UserDto.fromJson(userJson));
  }

  Future<ApiResult<dynamic>> deleteUser() =>
      ApiResultWrapper.wrap(() => _source.deleteUser());

  Future<ApiResult<dynamic>> updateUser(UserUpdateDto dto) =>
      ApiResultWrapper.wrap(() => _source.updateUser(dto));
}
