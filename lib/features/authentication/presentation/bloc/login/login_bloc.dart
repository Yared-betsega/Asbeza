import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';
import 'package:asbeza/features/authentication/domain/usecases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase usecase;

  LoginBloc({required this.usecase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      final Either<Failure, LoginPayload> response = await usecase(LoginPayload(
        email: event.email,
        password: event.password,
      ));

      response.fold(
          (Failure failure) => emit(LoginFailure(failure.message)),
          (LoginPayload payload) =>
              emit(LoginSuccess(payload.email, payload.password)));
    });
  }
}
