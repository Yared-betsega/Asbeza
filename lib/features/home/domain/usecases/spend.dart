import 'package:asbeza/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/transaction.dart';

class SpendUsecase extends UseCase<Transaction, Transaction> {
  final HomeRepository homeRepository;

  SpendUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, Transaction>> call(params) async {
    return await homeRepository.spend(params);
  }
}
