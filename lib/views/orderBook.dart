import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:OrderBook/componets/transactionListView.dart';
import 'package:OrderBook/cubits/errorCubit.dart';
import 'package:OrderBook/cubits/transactionCubit.dart';
import 'package:OrderBook/websocket/subscription.dart';

class OrderBook extends StatefulWidget {
  OrderBook({Key key}) : super(key: key);

  @override
  _OrderBookState createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  @override
  void initState() {
    Subscription.startOrderBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Book'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<ErrorCubit, Error>(
                  builder: (context, err) {
                    //TODO
                    return Visibility(
                      visible: err != null,
                      child: Text('a WebSocket error occured: $err'),
                    );
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Bids"),
              Text("Asks"),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TransactionListView<BidTransationCubit>(),
                ),
                Expanded(
                  child: TransactionListView<AskTransactionCubit>(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
