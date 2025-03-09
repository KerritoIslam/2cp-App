import 'dart:convert';

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
  final AuthRepository authRepository;
  final LocalSecureStorage localSecureStorage;
  final LocalStorage localStorage;
  Future<Either<Failure, User>> _init() async {
    final tokens = await authRepository.checkTokens();
    return await tokens.fold((l) {
      return left(Failure(l.message));
    }, (r) async {
      print(r.accessToken + r.refreshToken);
      final user = await localStorage.getUser();
      return user.fold((l) {
        return left(Failure('Error getting user: ${l.message}'));
      }, (r) {
        final userMap = jsonDecode(r);
        return right(User.fromJson(userMap));
      });
    });
  }

  AuthBloc(
      {required this.authRepository,
      required this.localSecureStorage,
      required this.localStorage})
      : super(AuthInitial()) {
    _init().then((value) {
      value.fold((l) {
        print(
            '${l.message}------------------------1111111111111111111111----------------------------');
        add(AuthLogoutRequested());
      }, (user) {
        add(UserLoaded(user));
      });
    });

    on<AuthLoginRequested>((event, emit) async {
      print(
          'login requested ------------------------1111111111111111111111----------------------------');
      final user = await authRepository.login(event.email, event.password);
      user.fold((l) {
        print(
            '${l.message}------------------------1111111111111111111111----------------------------');
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
            print(
                '${failure.message}------------------------------------------------1111111111111111111--------------------------------------------');
          },
          (user) {
            emit(Authenticated(user));
          },
        );
      } catch (e) {
        emit(AuthError('An error occurred'));
      }
    });
    on<AuthOTPRequested>(
      (event, emit) async {
        emit(AuthLoading());
        final response = await authRepository.forgetPassword(event.email);
        response.fold(
          (l) {
            emit(AuthError(l.message));
          },
          (r) {
            emit(Unauthenticated(OTP: r));
          },
        );
      },
    );
    on<AuthResetPasswordRequested>(
      (event, emit) async {
        emit(AuthLoading());
        final response =
            await authRepository.resetPassword(event.email, event.password);
        response.fold(
          (l) {
            emit(AuthError(l.message));
          },
          (r) {
            emit(Unauthenticated());
          },
        );
      },
    );
    on<AuthGoogleSignInRequested>((event, emit) async {
      final user = await authRepository.googleSignIn();
      user.fold((l) {
        print(
            '${l.message}------------------------1111111111111111111111----------------------------');
        emit(AuthError(l.message));
      }, (user) {
        emit(Authenticated(user));
      });
    });
    on<AuthLinkedInSignInRequested>((event, emit) async {
      final user = await authRepository.linkedInSignIn(event.context);
      user.fold((l) {
        print(
            '${l.message}------------------------1111111111111111111111----------------------------');
        emit(AuthError(l.message));
      }, (user) {
        emit(Authenticated(user));
      });
    });

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
    on<UserLoaded>((event, emit) async {
      emit(Authenticated(event.user));
    });
  }
}
