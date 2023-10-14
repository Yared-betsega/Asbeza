import 'package:asbeza/asbeza.dart';

class Transaction extends Equatable {
  final String name;
  final Timestamp date;
  final int amount;
  final int type;
  final String reason;
  final String category;
  final bool add;

  const Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
    required this.reason,
    required this.category,
    required this.add,
  });

  @override
  List<Object?> get props => [name, date, amount, type, reason, category];
}
