import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.totalBalance,
    required super.income,
    required super.expenses,
    required super.transactions,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      totalBalance: json['totalBalance'],
      income: json['income'],
      expenses: json['expenses'],
      transactions: json['transactions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'income': income,
      'expenses': expenses,
      'transactions': transactions,
    };
  }
}
