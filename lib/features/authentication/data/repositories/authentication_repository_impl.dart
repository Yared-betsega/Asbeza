import 'package:asbeza/core/errors/failures.dart';
import 'package:asbeza/features/authentication/data/datasources/remote_data_source.dart';
import 'package:asbeza/features/authentication/data/models/login_payload_model.dart';

import 'package:asbeza/features/authentication/domain/entities/login_payload.dart';

import 'package:asbeza/features/authentication/domain/entities/signup_payload.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../models/signup_payload_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource dataSource;

  AuthenticationRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, LoginPayload>> login(LoginPayload payload) async {
    try {
      final LoginPayloadModel loginPayloadModel =
          await dataSource.login(payload: payload);
      return Right<Failure, LoginPayload>(loginPayloadModel);
    } catch (e) {
      return Left<Failure, LoginPayload>(ServerFailure(e.toString()));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, SignUpPayload>> signUp(SignUpPayload payload) async {
    try {
      final SignUpPayloadModel signUpPayloadModel =
          await dataSource.signup(payload: payload);
      return Right<Failure, SignUpPayloadModel>(signUpPayloadModel);
    } catch (e) {
      return Left<Failure, SignUpPayload>(ServerFailure(e.toString()));
    }
  }

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
