part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserCredential credentials;

  const SignupSuccess({required this.credentials});
}

final class SignupFailure extends SignupState {
  final String message;
  const SignupFailure({required this.message});
}
