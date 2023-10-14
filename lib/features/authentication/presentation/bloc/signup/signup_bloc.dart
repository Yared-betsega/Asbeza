import 'package:asbeza/asbeza.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase usecase;
  SignupBloc({required this.usecase}) : super(SignupInitial()) {
    on<SignUp>((event, emit) async {
      emit(SignupLoading());
      final Either<Failure, UserCredential> response =
          await usecase(SignUpPayload(
        email: event.email,
        password: event.password,
      ));
      response.fold(
          (Failure failure) => emit(SignupFailure(message: failure.message)),
          (UserCredential payload) =>
              emit(SignupSuccess(credentials: payload)));
    });
  }
}
