import 'package:marketmind/features/_shared/data/dto/user_dto.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final UserDto user;
   LoginSuccess(this.user);
}

class RegistrationSuccess extends AuthState {
  final String message;
  RegistrationSuccess(this.message);
}

class GoogleSignInLoading extends AuthState {}

class AppleSignInLoading extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class OAuthSuccess extends AuthState {
  final String email;
  final String? name;

  OAuthSuccess({required this.email, this.name});
}
