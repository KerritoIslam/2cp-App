abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested(this.email, this.password);
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUpRequested(this.email, this.password , this.name);
}

class AuthForgotPasswordRequested extends AuthEvent {
  final String email;
  AuthForgotPasswordRequested(this.email);
}

//class AuthTokenRefreshed extends AuthEvent {}
class AuthLogoutRequested extends AuthEvent {}