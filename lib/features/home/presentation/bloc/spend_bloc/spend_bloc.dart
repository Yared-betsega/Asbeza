import 'package:asbeza/asbeza.dart';

part 'spend_event.dart';
part 'spend_state.dart';

class SpendBloc extends Bloc<SpendEvent, SpendState> {
  final SpendUsecase spendUsecase;
  SpendBloc({required this.spendUsecase}) : super(SpendInitial()) {
    on<Spend>((event, emit) async {
      emit(SpendLoading());

      final transactionPayload = Transaction(
        amount: event.amount,
        name: event.name,
        category: event.category,
        date: event.date,
        reason: event.reason,
        type: event.type,
        add: event.add,
      );
      final Either<Failure, Transaction> response =
          await spendUsecase(transactionPayload);

      response.fold(
          (Failure failure) => emit(SpendFailure(message: failure.message)),
          (Transaction payload) => emit(SpendSuccess(transaction: payload)));
    });
  }
}
