import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested({required this.email, required this.password});
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUpRequested(
      {required this.email, required this.password, required this.name});
}

class AuthOTPRequested extends AuthEvent {
  final String email;
  AuthOTPRequested(this.email);
}

class AuthResetPasswordRequested extends AuthEvent {
  final String email;
  final String password;

  AuthResetPasswordRequested({required this.email, required this.password});
}

class AuthGoogleSignInRequested extends AuthEvent {}

class AuthLinkedInSignInRequested extends AuthEvent {
  BuildContext context;
  AuthLinkedInSignInRequested(this.context);
}
class UserLoaded extends AuthEvent {
  final User user;
  UserLoaded(this.user);
  
}


class AuthLogoutRequested extends AuthEvent {}
