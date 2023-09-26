import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/transaction.dart' as transaction_entity;
import '../../../domain/usecases/spend.dart';

part 'spend_event.dart';
part 'spend_state.dart';

class SpendBloc extends Bloc<SpendEvent, SpendState> {
  final SpendUsecase spendUsecase;
  SpendBloc({required this.spendUsecase}) : super(SpendInitial()) {
    on<Spend>((event, emit) async {
      emit(SpendLoading());

      final transactionPayload = transaction_entity.Transaction(
        amount: event.amount,
        name: event.name,
        category: event.category,
        date: event.date,
        reason: event.reason,
        type: event.type,
        add: event.add,
      );
      final Either<Failure, transaction_entity.Transaction> response =
          await spendUsecase(transactionPayload);

      response.fold(
          (Failure failure) => emit(SpendFailure(message: failure.message)),
          (transaction_entity.Transaction payload) =>
              emit(SpendSuccess(transaction: payload)));
    });
  }
}
