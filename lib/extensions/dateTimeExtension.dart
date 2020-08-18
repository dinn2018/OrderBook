import 'package:intl/intl.dart';

extension DataTimeExtension on DateTime {
  String get formatTime {
    return DateFormat('kk:mm:ss').format(this);
  }
}
