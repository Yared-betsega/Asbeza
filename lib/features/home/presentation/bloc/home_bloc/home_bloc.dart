import 'package:asbeza/asbeza.dart';

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
