import 'package:OrderBook/cubits/transactionCubit.dart';
import 'package:flutter/material.dart';

class Order {
  List<Transaction> bids;
  List<Transaction> asks;

  Order({
    @required this.bids,
    @required this.asks,
  });

  factory Order.fromSocketData(dynamic data, String timestamp) {
    final dateTime = DateTime.parse(timestamp);
    return Order(
      bids: _generateTransations(data['bids'], dateTime),
      asks: _generateTransations(data['asks'], dateTime),
    );
  }

  static List<Transaction> _generateTransations(
      dynamic data, DateTime dateTime) {
    List<Transaction> transactions = [];
    for (final tx in data) {
      final transaction = Transaction(
        price: tx[0],
        quantity: tx[1],
        time: dateTime,
      );
      transactions.add(transaction);
    }
    return transactions;
  }

  void broadcastTrasaction() {
    askTransactionCubit.onTransations(this.asks ?? []);
    bidTransationCubit.onTransations(this.bids ?? []);
  }
}

class Transaction {
  String price;
  int quantity;
  DateTime time;

  Transaction({
    @required this.price,
    @required this.quantity,
    @required this.time,
  });
}
