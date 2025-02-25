import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:app/utils/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      final user = await authRepository.login(event.email, event.password);
      user.fold((l) {
        return emit(AuthError(l.message));
      }, (user) => emit(Authenticated(user)));
    });

    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        Either<Failure, User> user = await authRepository.register(
            event.name, event.email, event.password);

        user.fold(
          (failure) {
            emit(AuthError(failure.message));
            print(failure.message);
          },
          (user) {
            emit(Authenticated(user));
          },
        );
      } catch (e) {
        emit(AuthError('An error occurred'));
      }
    });
    on<AuthGoogleSignInRequested>((event, emit) async {
      final user = await authRepository.googleSignIn();
      user.fold((l) {
        print(
            '${l.message}----------------------------------------------------');
        emit(AuthError(l.message));
      }, (user) {
        emit(Authenticated(user));
      });
    });
    on<AuthLinkedInSignInRequested>((event, emit) async {
      final user = await authRepository.linkedInSignIn(event.context);
      user.fold((l) {
        emit(AuthError(l.message));
      }, (user) {
        emit(Authenticated(user));
      });
    });
    on<AuthForgotPasswordRequested>((event, emit) {});
    on<AuthLogoutRequested>((event, emit) async {
      final dataSource = locator.get<LocalSecureStorage>();
      try {
        await dataSource.deleteToken('access');
        await dataSource.deleteToken('refresh');
      } catch (e) {
        print(e.toString());
      }
      emit(Unauthenticated());
    });
  }
}
