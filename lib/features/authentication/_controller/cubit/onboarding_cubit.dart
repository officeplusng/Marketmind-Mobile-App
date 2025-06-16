import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/authentication/_controller/state/auth_state.dart';

class AuthenticationCubit extends Cubit<AuthState> {
  AuthenticationCubit() : super(AuthInitial());

  void login(){}
  void register(){}
}
