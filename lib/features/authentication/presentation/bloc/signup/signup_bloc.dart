import 'package:asbeza/features/authentication/domain/entities/signup_payload.dart';
import 'package:asbeza/features/authentication/domain/usecases/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase usecase;
  SignupBloc({required this.usecase}) : super(SignupInitial()) {
    on<SignUp>((event, emit) async {
      emit(SignupLoading());
      final Either<Failure, SignUpPayload> response =
          await usecase(SignUpPayload(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      response.fold(
          (Failure failure) => emit(SignupFailure(message: failure.message)),
          (SignUpPayload payload) => emit(SignupSuccess(
              name: payload.name,
              email: payload.email,
              password: payload.password)));
    });
  }
}
