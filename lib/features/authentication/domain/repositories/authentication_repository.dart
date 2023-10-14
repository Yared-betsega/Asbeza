import 'package:asbeza/asbeza.dart';

abstract class AuthenticationRepository extends Equatable {
  Future<Either<Failure, UserCredential>> login(LoginPayload payload);
  Future<Either<Failure, UserCredential>> signUp(SignUpPayload payload);
}
