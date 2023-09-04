import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/signup_payload.dart';
import '../repositories/authentication_repository.dart';

class SignUpUseCase extends UseCase<SignUpPayload, SignUpPayload> {
  final AuthenticationRepository authenticationRepository;

  SignUpUseCase({required this.authenticationRepository});

  @override
  Future<Either<Failure, SignUpPayload>> call(SignUpPayload params) async {
    return await authenticationRepository.signUp(params);
  }
}
