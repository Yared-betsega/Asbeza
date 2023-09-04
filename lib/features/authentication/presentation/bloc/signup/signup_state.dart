part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String name;
  final String email;
  final String password;

  const SignupSuccess({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class SignupFailure extends SignupState {
  final String message;
  const SignupFailure({required this.message});
}
