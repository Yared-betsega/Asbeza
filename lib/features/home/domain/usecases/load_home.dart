import 'package:asbeza/asbeza.dart';

class LoadHomeUsecase extends UseCase<UserProfile, NoParams> {
  final HomeRepository homeRepository;

  LoadHomeUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) async {
    return await homeRepository.loadHome();
  }
}
