import 'dart:convert';

import 'package:asbeza/core/errors/exceptions.dart';
import 'package:asbeza/features/authentication/data/models/signup_payload_model.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/login_payload.dart';
import '../../domain/entities/signup_payload.dart';
import '../models/login_payload_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginPayloadModel> login({required LoginPayload payload});
  Future<SignUpPayloadModel> signup({required SignUpPayload payload});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final http.Client client;

  AuthenticationRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginPayloadModel> login({required LoginPayload payload}) async {
    const String uri = "";
    try {
      final http.Response response = await http.post(Uri.parse(uri));
      if (response.statusCode == 200) {
        return LoginPayloadModel.fromJson(json.decode(response.body));
      }
      throw ServerException(response.statusCode.toString());
    } catch (e) {
      throw ServerException("Server failed to respond");
    }
  }

  @override
  Future<SignUpPayloadModel> signup({required SignUpPayload payload}) async {
    const String uri = "";
    try {
      final http.Response response = await http.post(Uri.parse(uri));
      if (response.statusCode == 200) {
        return SignUpPayloadModel.fromJson(json.decode(response.body));
      }
      throw ServerException(response.statusCode.toString());
    } catch (e) {
      throw ServerException("Server failed to respond");
    }
  }
}
