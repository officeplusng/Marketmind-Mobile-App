import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/_controller/state/auth_state.dart';
import 'package:marketmind/features/authentication/data/dto/email_dto.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_sign_up_dto.dart';
import 'package:marketmind/features/authentication/data/dto/verify_token_dto.dart';
import 'package:marketmind/features/authentication/domain/repositories/auth_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class AuthenticationCubit extends BaseCubit<AuthState> {
  late AuthRepository _repository;
  late SecureStorageService _storageService;

  AuthenticationCubit() : super(InitialState(data: AuthInitial())) {
    _repository = getIt<AuthRepository>();
    _storageService = getIt<SecureStorageService>();
  }

  void login(LoginDto dto) async {
    emitLoading();
    final response = await _repository.login(dto);
    response.when(
        onSuccess: (result) {
          //todo cache user
        },
        onError: (error) {});
  }

  void register(RegisterDto dto) async {
    emitLoading();
    final response = await _repository.register(dto);
    response.when(
        onSuccess: (result) {
          //todo cache user
        },
        onError: (error) {});
  }

  void resendEmail(EmailDto dto) async {
    emitLoading();
    final response = await _repository.resendEmail(dto);
    response.when(onSuccess: (result) {}, onError: (error) {});
  }

  void verifyToken(VerifyTokenDto dto) async {
    emitLoading();
    final response = await _repository.verifyToken(dto);
    response.when(onSuccess: (result) {}, onError: (error) {});
  }

  void verifySignUp(VerifySignUpDto dto) async {
    emitLoading();
    final response = await _repository.verifySignUp(dto);
    response.when(onSuccess: (result) {}, onError: (error) {});
  }

  void signInWithGoogle() {}

  void signInWithApple() {}
}
