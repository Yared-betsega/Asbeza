import 'package:asbeza/core/errors/failures.dart';
import 'package:asbeza/core/usecases/usecase.dart';
import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';
import 'package:asbeza/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<LoginPayload, LoginPayload> {
  final AuthenticationRepository authenticationRepository;

  LoginUsecase({required this.authenticationRepository});

  @override
  Future<Either<Failure, LoginPayload>> call(LoginPayload params) async {
    return await authenticationRepository.login(params);
  }
}
