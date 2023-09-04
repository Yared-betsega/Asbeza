import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';
import 'package:asbeza/features/authentication/domain/entities/signup_payload.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthenticationRepository extends Equatable {
  Future<Either<Failure, LoginPayload>> login(LoginPayload payload);
  Future<Either<Failure, SignUpPayload>> signUp(SignUpPayload payload);
}
