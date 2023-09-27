part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final UserProfile profile;

  const HomeSuccess({required this.profile});
}

final class HomeFailed extends HomeState {
  final String message;

  const HomeFailed({required this.message});
}
