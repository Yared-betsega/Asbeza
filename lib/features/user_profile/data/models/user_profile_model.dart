import 'package:asbeza/asbeza.dart';

class UserProfileModel extends UserProfile {
  final String id;

  const UserProfileModel({
    required this.id,
    required super.totalBalance,
    required super.income,
    required super.expenses,
    required super.debt,
    required super.credit,
    required super.transactions,
  });

  factory UserProfileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      List<TransactionModel> transactions) {
    final data = document.data()!;

    return UserProfileModel(
      id: document.id,
      totalBalance: data['totalBalance'].toDouble(),
      income: data['income'].toDouble(),
      expenses: data['expenses'].toDouble(),
      debt: data['debt'].toDouble(),
      credit: data['credit'].toDouble(),
      transactions: transactions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'income': income,
      'expenses': expenses,
      'transactions': transactions,
      'debt': debt,
      'credit': credit,
    };
  }
}
