
import 'package:asbeza/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/login_payload.dart';
import '../../domain/entities/signup_payload.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserCredential> login({required LoginPayload payload});
  Future<UserCredential> signup({required SignUpPayload payload});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final http.Client client;

  AuthenticationRemoteDataSourceImpl({required this.client});

  @override
  Future<UserCredential> login({required LoginPayload payload}) async {
    try {
      final UserCredential response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: payload.email, password: payload.password);

      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw ServerException('Email or password incorrect');
      } else {
        throw ServerException('Cannot login at this time.');
      }
    }
  }

  @override
  Future<UserCredential> signup({required SignUpPayload payload}) async {
    try {
      final UserCredential response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: payload.email, password: payload.password);
      return response;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message!);
    }
  }
}
