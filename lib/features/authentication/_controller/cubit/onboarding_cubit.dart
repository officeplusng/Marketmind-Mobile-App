import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/_controller/state/auth_state.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/domain/repositories/auth_repository.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class OAuthCredentialWrapper {
  final OAuthCredential credential;
  final String? name;
  final String? email;

  const OAuthCredentialWrapper(
      {required this.credential, required this.name, required this.email});
}

enum OAuthType { google, apple }

class AuthenticationCubit extends Cubit<AuthState> {
  late AuthRepository _repository;
  late SecureStorageService _storageService;

  AuthenticationCubit() : super(AuthInitial()) {
    _repository = getIt<AuthRepository>();
    _storageService = getIt<SecureStorageService>();
  }

  void login(LoginDto dto) async {
    emit(AuthLoading());
    final response = await _repository.login(dto);
    response.when(onSuccess: (result) async {
      final userFromAuthResponse = result.toUserDto();
      await _storageService.write(
          StorageKeys.userDetails, jsonEncode(userFromAuthResponse.toJson()));
      emit(LoginSuccess(userFromAuthResponse));
    }, onError: (error) {
      emit(AuthError(error));
    });
  }

  void register(RegisterDto dto) async {
    emit(AuthLoading());
    final response = await _repository.register(dto);
    response.when(onSuccess: (result) {
     final message =  result.message??'Registration successful';
      emit(RegistrationSuccess(message));
    }, onError: (error) {
      emit(AuthError(error));
    });
  }

  Future<void> oauth(OAuthType type) async {
    OAuthCredentialWrapper? credential;
    if (type == OAuthType.google) {
      credential = await _signInWithGoogle();
    } else {
      credential = await _signInWithApple();
    }
    if (credential == null) {
      return;
    }
    emit(AuthLoading());

    try {
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(credential.credential.idToken ?? '');
      final email = decodedToken['email'];
      emit(OAuthSuccess(
        email: credential.email ?? '',
        name: credential.name,
      ));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<OAuthCredentialWrapper?> _signInWithGoogle() async {
    try {
      // Trigger the authentication flow

      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      print('google auth user -> ${googleUser?.displayName}');
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential

      return OAuthCredentialWrapper(
        credential: credential,
        name: googleUser?.displayName,
        email: googleUser?.email,
      );
    } catch (e) {
      emit(AuthError('Something went wrong'));
      return null;
    }
  }

  Future<OAuthCredentialWrapper?> _signInWithApple() async {
    try {
      // Trigger the authentication flow
      final appleUser = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ]);
      final token = appleUser.identityToken;
      if (token == null) {
        emit(AuthError('Something went wrong'));
      }

      final provider = OAuthProvider('apple.com');
      final credential = provider.credential(
          accessToken: appleUser.authorizationCode, idToken: token);

      return OAuthCredentialWrapper(
          credential: credential,
          name: appleUser.givenName,
          email: appleUser.email);
    } catch (e) {
      emit(AuthError('Something went wrong'));
      return null;
    }
  }
}
