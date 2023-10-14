import 'package:asbeza/asbeza.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.name,
    required super.date,
    required super.amount,
    required super.type,
    required super.reason,
    required super.category,
    required super.add,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        amount: json["amount"],
        type: json["type"],
        reason: json["reason"],
        name: json["name"],
        category: json["category"],
        date: json["date"],
        add: json["add"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'amount': amount,
      'type': type,
      'reason': reason,
      'category': category
    };
  }
}
