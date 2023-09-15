import 'dart:convert';

import 'package:asbeza/features/home/domain/entities/transaction.dart';
import 'package:asbeza/features/user_profile/data/models/user_profile_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/user_profile_model.dart';

abstract class HomeRemoteDataSource {
  Future<TransactionModel> spend({required Transaction model});
  Future<UserProfileModel> loadHome();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});
  @override
  Future<TransactionModel> spend({required Transaction model}) async {
    const String uri = '';
    try {
      final http.Response response = await http.post(Uri.parse(uri));
      if (response.statusCode == 200) {
        return TransactionModel.fromJson(json.decode(response.body));
      }
      throw ServerException(response.statusCode.toString());
    } catch (e) {
      throw ServerException("Server failed to respond");
    }
  }

  @override
  Future<UserProfileModel> loadHome() async {
    const String uri = '';
    try {
      final http.Response response = await http.post(Uri.parse(uri));
      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(json.decode(response.body));
      }
      throw ServerException(response.statusCode.toString());
    } catch (e) {
      throw ServerException("Server failed to respond");
    }
  }
}
