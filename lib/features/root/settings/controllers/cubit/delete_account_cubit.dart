import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/domain/repo/user_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class DeleteAccountCubit extends BaseCubit {
  late UserRepository _repository;
  late SecureStorageService _storageService;

  DeleteAccountCubit() : super(const InitialState()) {
    _repository = getIt<UserRepository>();
    _storageService = getIt<SecureStorageService>();
  }

  void deleteAccount() async {
    emitLoading();
    final response = await _repository.deleteUser();
    response.when(onSuccess: (result) async {
      await _storageService.tearDown();
      emitSuccess();
    }, onError: (error) {
      emitError(error);
    });
  }
}
