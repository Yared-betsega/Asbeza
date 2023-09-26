import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../user_profile/domain/entities/user_profile.dart';
import '../../../domain/usecases/load_home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadHomeUsecase loadHomeUsecase;
  HomeBloc({required this.loadHomeUsecase}) : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      emit(HomeLoading());

      final Either<Failure, UserProfile> response =
          await loadHomeUsecase(NoParams());

      response.fold(
          (Failure failure) => emit(HomeFailed(message: failure.message)),
          (UserProfile payload) => emit(HomeSuccess(profile: payload)));
    });
  }
}
