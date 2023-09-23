part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserCredential credentials;

  const LoginSuccess({required this.credentials});
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);
}

class LoginWithGoogleSuccess extends LoginState {}
