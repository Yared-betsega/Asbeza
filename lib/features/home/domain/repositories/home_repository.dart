import 'package:asbeza/features/user_profile/domain/entities/user_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/transaction.dart';

abstract class HomeRepository extends Equatable {
  Future<Either<Failure, Transaction>> spend(Transaction newTransaction);
  Future<Either<Failure, UserProfile>> loadHome();
}
