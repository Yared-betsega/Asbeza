import 'package:asbeza/asbeza.dart';

class UserProfile extends Equatable {
  final double totalBalance;
  final double income;
  final double expenses;
  final double debt;
  final double credit;
  final List<Transaction> transactions;

  const UserProfile({
    required this.totalBalance,
    required this.income,
    required this.expenses,
    required this.debt,
    required this.credit,
    required this.transactions,
  });

  @override
  List<Object?> get props =>
      [totalBalance, income, expenses, transactions, debt, credit];
}
