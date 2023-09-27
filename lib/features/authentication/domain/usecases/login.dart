import 'package:asbeza/core/errors/failures.dart';
import 'package:asbeza/core/usecases/usecase.dart';
import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';
import 'package:asbeza/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase extends UseCase<UserCredential, LoginPayload> {
  final AuthenticationRepository authenticationRepository;

  LoginUsecase({required this.authenticationRepository});

  @override
  Future<Either<Failure, UserCredential>> call(LoginPayload params) async {
    return await authenticationRepository.login(params);
  }
}
