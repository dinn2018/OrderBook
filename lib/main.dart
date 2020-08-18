import 'package:flutter/material.dart';
import 'package:OrderBook/cubits/providers.dart';
import 'package:OrderBook/views/orderBook.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        title: 'Duedex Order book',
        home: OrderBook(),
      ),
    );
  }
}
