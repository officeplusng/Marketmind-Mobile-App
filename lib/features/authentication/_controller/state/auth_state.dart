sealed class AuthState{}
class AuthInitial extends AuthState{}
class LoginSuccess extends AuthState{

}
class RegistrationSuccess extends AuthState{}
class GoogleSignInLoading extends AuthState{}
class AppleSignInLoading extends AuthState{}
class AuthLoading extends AuthState{}
