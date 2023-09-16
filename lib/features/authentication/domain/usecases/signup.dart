import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/signup_payload.dart';
import '../repositories/authentication_repository.dart';

class SignUpUseCase extends UseCase<UserCredential, SignUpPayload> {
  final AuthenticationRepository authenticationRepository;

  SignUpUseCase({required this.authenticationRepository});

  @override
  Future<Either<Failure, UserCredential>> call(SignUpPayload params) async {
    return await authenticationRepository.signUp(params);
  }
}
