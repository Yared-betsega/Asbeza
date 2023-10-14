import 'package:asbeza/asbeza.dart';

abstract class HomeRepository extends Equatable {
  Future<Either<Failure, Transaction>> spend(Transaction newTransaction);
  Future<Either<Failure, UserProfile>> loadHome();
}
