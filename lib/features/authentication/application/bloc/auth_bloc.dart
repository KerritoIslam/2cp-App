import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/authentication/domain/auth_repository.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
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
      return left(Failure('Error getting tokens :${l.message}'));
    }, (r) async {
      final user = await authRepository.getUser();
      return user.fold((l) {
        return left(Failure('Error getting user: ${l.message}'));
      }, (r) {
        return right(r);
      });
    });
  }

  AuthBloc(
      {required this.authRepository,
      required this.localSecureStorage,
      required this.localStorage})
      : super(AuthLoading()) {
    print(state.toString());
    on<UserDataLoaded>((event, emit) async {
      _init().then((value) {
        value.fold((l) {
          add(AuthLogoutRequested());
        }, (user) {
          add(UserLoaded(user));
        });
      });
    });
    on<AuthLoginRequested>((event, emit) async {
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
        await dataSource.deleteToken('accessToken');
        await dataSource.deleteToken('refreshToken');
        final tokens = await dataSource.getTokens();
        tokens.fold((l) {
          print(l.message);
        }, (r) {
          print('Tokens are : ${r.accessToken}, ${r.refreshToken}');
        });
      } catch (e) {
        print(e.toString());
      }
      emit(Unauthenticated());
    });
    on<UserLoaded>((event, emit) async {
      emit(Authenticated(event.user));
    });
    on<AuthUserUpdated>((event, emit) async {
      /* emit(AuthLoading());
      final response = await authRepository.updateUser(event.user);
      response.fold(
          (r) => emit(AuthError(r.message)), (l) => emit(Authenticated(l))); */
      emit(Authenticated(event.user));
    });
  }
}
