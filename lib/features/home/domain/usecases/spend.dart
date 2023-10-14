import 'package:asbeza/asbeza.dart';

class SpendUsecase extends UseCase<Transaction, Transaction> {
  final HomeRepository homeRepository;

  SpendUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, Transaction>> call(params) async {
    return await homeRepository.spend(params);
  }
}
