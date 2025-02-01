import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBolc extends Bloc<AuthEvent, AuthState> {
  AuthBolc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {});
    on<AuthSignUpRequested>((event, emit) {});
    on<AuthForgotPasswordRequested>((event, emit) {});
    on<AuthLogoutRequested>((event, emit) {});
  }
}
