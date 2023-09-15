import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String name;
  final DateTime date;
  final double amount;
  final String type;
  final String reason;
  final String category;

  const Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
    required this.reason,
    required this.category,
  });

  @override
  List<Object?> get props => [name, date, amount, type, reason, category];
}
