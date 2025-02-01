abstract class AuthEvent {}
  
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  SignUpEvent(this.email, this.password);
}
class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}
//class RefrechTokenEvent extends AuthEvent {}
class LogoutEvent extends AuthEvent {}