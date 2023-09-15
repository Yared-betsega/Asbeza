import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_profile/domain/entities/user_profile.dart';
import '../repositories/home_repository.dart';

class LoadHomeUsecase extends UseCase<UserProfile, NoParams> {
  final HomeRepository homeRepository;

  LoadHomeUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) async {
    return await homeRepository.loadHome();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
