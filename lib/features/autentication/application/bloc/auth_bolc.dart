import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBolc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBolc(this.authRepository) : super(AuthInitial()) {
    
   
    on<AuthLoginRequested>((event, emit) {});
    on<AuthSignUpRequested>((event, emit) {
      emit(AuthLoading());
      authRepository.register(event.name, event.email, event.password).then((value) {
        value.fold((failure) {
          emit(AuthError(failure.message));
        }, (user) {
          emit(Authenticated(user));
          print(user.name);
        });
      });
    });
    on<AuthForgotPasswordRequested>((event, emit) {});
    on<AuthLogoutRequested>((event, emit) {});
  }
}
