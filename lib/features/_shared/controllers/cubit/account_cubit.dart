import 'dart:convert';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/data/dto/update_user_dto.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/_shared/domain/repo/user_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class AccountCubit extends BaseCubit<UserDto> {
  late UserRepository _repo;
  late SecureStorageService _storageService;

  AccountCubit() : super(const InitialState()) {
    _repo = getIt<UserRepository>();
    _storageService = getIt<SecureStorageService>();
  }

  init() async {
    if (data == null) {
      final localUser = await _repo.getLoggedInUser();
      localUser.when(onSuccess: (result) {
        emitSuccess(data: result);
      }, onError: (error) {
        emitError(error);
      });
    }
  }

  void updateUser(UserUpdateDto dto) async {
    emitLoading();
    final response = await _repo.updateUser(dto);
    response.when(onSuccess: (result) {
      emitSuccess();
    }, onError: (error) {
      emitError(error);
    });
  }

  _cacheUser(UserDto dto) async {
    await _storageService.write(
        StorageKeys.userDetails, jsonEncode(dto.toJson()));
  }

  void refresh() async {
    emitLoading();
    final response = await _repo.getUser();
    response.when(
        onSuccess: (result) {
          emitSuccess(data: result);
          _cacheUser(result);
        },
        onError: (value) {});
  }
}
