import 'package:flutter/material.dart';
import 'package:OrderBook/models/order.dart';
import 'package:OrderBook/extensions/dateTimeExtension.dart';

class TransactionCell extends StatelessWidget {
  final Transaction transaction;

  TransactionCell({
    @required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _text(context, '${transaction.quantity}'),
            _text(context, '\$${transaction.price}'),
            _text(context, '${transaction.time.formatTime}'),
          ],
        ),
      ),
      style: TextStyle(
        fontSize: 11,
      ),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  Widget _text(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      child: Text(text),
    );
  }
}
