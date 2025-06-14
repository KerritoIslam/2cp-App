import 'package:app/features/authentication/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);
}

class Unauthenticated extends AuthState {
  int? OTP;
  Unauthenticated({this.OTP});
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthUserUpdatedSuccessfully extends AuthState {
  final String message;
  AuthUserUpdatedSuccessfully(this.message);
}

class AuthPasswordUpdatedSuccessfully extends AuthState {}
