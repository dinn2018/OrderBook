import 'package:OrderBook/models/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BidTransationCubit bidTransationCubit = BidTransationCubit();

AskTransactionCubit askTransactionCubit = AskTransactionCubit();

class BidTransationCubit extends TransactionCubit {}

class AskTransactionCubit extends TransactionCubit {}

abstract class TransactionCubit extends Cubit<List<Transaction>> {
  TransactionCubit() : super([]);

  void onTransations(List<Transaction> transactions) {
    if (transactions.length > 0) {
      emit(transactions);
    }
  }

  List<Transaction> get transactions => state;
}
