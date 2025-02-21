

abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested({required this.email,required this.password});
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUpRequested({required this.email,required this.password ,required this.name});
}

class AuthGoogleSignInRequested extends AuthEvent {}

class AuthForgotPasswordRequested extends AuthEvent {
  final String email;
  AuthForgotPasswordRequested({required this.email});
}

//class AuthTokenRefreshed extends AuthEvent {}
class AuthLogoutRequested extends AuthEvent {}