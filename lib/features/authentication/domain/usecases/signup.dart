import 'package:asbeza/asbeza.dart';

class SignUpUseCase extends UseCase<UserCredential, SignUpPayload> {
  final AuthenticationRepository authenticationRepository;

  SignUpUseCase({required this.authenticationRepository});

  @override
  Future<Either<Failure, UserCredential>> call(SignUpPayload params) async {
    return await authenticationRepository.signUp(params);
  }
}
