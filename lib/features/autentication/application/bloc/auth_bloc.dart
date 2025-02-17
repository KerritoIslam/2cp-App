import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit)async {
      
    final user=await authRepository.login(event.email,event.password);      
    user.fold((l){
        print('Error $l');
              return emit(AuthError(l.message));
      }, (user)=>emit(Authenticated(user)));
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
    on<AuthForgotPasswordRequested>((event, emit) {});
    on<AuthLogoutRequested>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
