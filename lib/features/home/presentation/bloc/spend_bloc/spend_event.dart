part of 'spend_bloc.dart';

sealed class SpendEvent extends Equatable {
  const SpendEvent();

  @override
  List<Object> get props => [];
}

class Spend extends SpendEvent {
  final String name;
  final Timestamp date;
  final int amount;
  final int type;
  final String reason;
  final String category;
  final bool add;

  const Spend({
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
    required this.reason,
    required this.category,
    required this.add,
  });
}
