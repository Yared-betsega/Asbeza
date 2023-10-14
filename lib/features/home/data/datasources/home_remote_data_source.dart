import 'dart:convert';

import 'package:asbeza/asbeza.dart';
import 'package:http/http.dart' as http;

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
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .where('userId', isEqualTo: userId)
          .get();

      final userData = await snapshot.docs.map((e) async {
        final transactionSnapshot = await FirebaseFirestore.instance
            .collection("transactions")
            .where('userId', isEqualTo: userId)
            .get();
        final List<TransactionModel> transactions = [];
        for (var e in transactionSnapshot.docs) {
          final TransactionModel transactionModel =
              TransactionModel.fromJson(e.data());
          transactions.add(transactionModel);
        }
        return UserProfileModel.fromSnapshot(e, transactions);
      }).single;

      return userData;
    } catch (e) {
      throw ServerException("Server failed to respond");
    }
  }
}
