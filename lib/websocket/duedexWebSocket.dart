import 'dart:io';
import 'dart:convert';
import 'package:OrderBook/cubits/errorCubit.dart';
import 'package:OrderBook/models/order.dart';
import 'package:flutter/material.dart';

class DuedexWebSocket {
  static WebSocket _socket;

  static String _wsURL = 'wss://feed.duedex.com/v1/feed';

  static _init() async {
    try {
      if (_socket == null) {
        _socket = await WebSocket.connect(_wsURL);
        _socket.listen(
          _onData,
          onError: (e) {
            debugPrint("socket listen error: $e");
            errorCubit.errored(e);
            //always reset to listen websocket.
            reset();
          },
          onDone: () {
            errorCubit.errored(null);
          },
          cancelOnError: false,
        );
      }
    } catch (e) {
      errorCubit.errored(e);
    }
  }

  static _onData(dynamic socketData) {
    try {
      debugPrint('socketData $socketData');
      final data = json.decode(socketData);
      if (data['type'] == 'snapshot' || data['type'] == 'update') {
        final order = Order.fromSocketData(data['data'], data['timestamp']);
        order.broadcastTrasaction();
      } else {
        //maybe unneccessary
        errorCubit.errored(
          ArgumentError('unknown WebSocket data'),
        );
      }
    } catch (err) {
      errorCubit.errored(
        ArgumentError(err),
      );
    }
  }

  static bool get isAvailable => _socket != null;

  static add(dynamic data) {
    _socket.add(data);
  }

  static reset() async {
    _socket?.close();
    _socket = null;
    await _init();
  }
}
