import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';
import 'package:asbeza/features/authentication/domain/usecases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase usecase;

  LoginBloc({required this.usecase}) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final Either<Failure, UserCredential> response =
          await usecase(LoginPayload(
        email: event.email,
        password: event.password,
      ));

      response.fold(
          (Failure failure) => emit(LoginFailure(failure.message)),
          (UserCredential credential) =>
              emit(LoginSuccess(credentials: credential)));
    });
    on<LoginWithGoogle>((event, emit) async {
      emit(LoginLoading());
      AuthService().signInWithGoogle();
      print("About to emit =============");
      emit(LoginWithGoogleSuccess());
    });
    on<Logout>((event, emit) async {
      print("===========");
      FirebaseAuth.instance.signOut();
      emit(LoginInitial());
    });
  }
}
