part of 'spend_bloc.dart';

sealed class SpendState extends Equatable {
  const SpendState();

  @override
  List<Object> get props => [];
}

final class SpendInitial extends SpendState {}

final class SpendLoading extends SpendState {}

final class SpendSuccess extends SpendState {
  final Transaction transaction;

  const SpendSuccess({required this.transaction});
}

final class SpendFailure extends SpendState {
  final String message;

  const SpendFailure({required this.message});
}
