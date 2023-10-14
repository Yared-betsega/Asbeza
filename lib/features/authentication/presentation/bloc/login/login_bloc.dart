import 'package:asbeza/asbeza.dart';

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
      await AuthService().signInWithGoogle();
      emit(LoginWithGoogleSuccess());
    });
    on<Logout>((event, emit) async {
      await AuthService().singOut();
      emit(LoginInitial());
    });
  }
}
