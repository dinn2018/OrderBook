import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:OrderBook/componets/transactionCell.dart';
import 'package:OrderBook/cubits/transactionCubit.dart';
import 'package:OrderBook/models/order.dart';

//Transa
class TransactionListView<T extends TransactionCubit> extends StatefulWidget {
  TransactionListView();

  @override
  _TransactionListViewState<T> createState() => _TransactionListViewState<T>();
}

class _TransactionListViewState<T extends TransactionCubit>
    extends State<TransactionListView> {
  List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, List<Transaction>>(
      builder: (context, txs) {
        transactions.insertAll(0, txs);
        return Visibility(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionCell(transaction: transactions[index]);
            },
          ),
          visible: transactions.length > 0,
          replacement: Center(
            child: Text('loading'),
          ),
        );
      },
    );
  }
}
