import 'dart:convert';

import 'package:OrderBook/websocket/duedexWebSocket.dart';

// Subscription subscribe websocket
class Subscription {
  // subscribe bids and asks
  static void startOrderBook() async {
    // make sure WebSocket is open
    await _makeWebSocket();
    DuedexWebSocket.add(
      json.encode(
        {
          "type": "subscribe",
          "channels": [
            {
              "name": "level2",
              "instruments": ["BTCUSD"]
            }
          ]
        },
      ),
    );
  }

  static _makeWebSocket() async {
    if (!DuedexWebSocket.isAvailable) {
      await DuedexWebSocket.reset();
    }
  }
}
