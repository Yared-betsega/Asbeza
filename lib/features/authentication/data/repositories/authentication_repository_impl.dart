import 'package:asbeza/core/errors/exceptions.dart';
import 'package:asbeza/core/errors/failures.dart';
import 'package:asbeza/features/authentication/data/datasources/remote_data_source.dart';

import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';

import 'package:asbeza/features/authentication/domain/entities/signup_payload.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource dataSource;

  AuthenticationRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserCredential>> login(LoginPayload payload) async {
    try {
      final UserCredential credential =
          await dataSource.login(payload: payload);
      return Right<Failure, UserCredential>(credential);
    } on ServerException catch (e) {
      return Left<Failure, UserCredential>(ServerFailure(e.message));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, UserCredential>> signUp(SignUpPayload payload) async {
    try {
      final UserCredential signUpPayloadModel =
          await dataSource.signup(payload: payload);
      return Right<Failure, UserCredential>(signUpPayloadModel);
    } catch (e) {
      return Left<Failure, UserCredential>(ServerFailure(e.toString()));
    }
  }

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
