import 'package:asbeza/asbeza.dart';

class LoginUsecase extends UseCase<UserCredential, LoginPayload> {
  final AuthenticationRepository authenticationRepository;

  LoginUsecase({required this.authenticationRepository});

  @override
  Future<Either<Failure, UserCredential>> call(LoginPayload params) async {
    return await authenticationRepository.login(params);
  }
}
