import 'package:intl/intl.dart';

class CounterState {
  final int count;
  final DateTime lastUpdated;

  CounterState(this.count, this.lastUpdated);

  String get lastUpdatedFormatted =>
      DateFormat("dd/MM/yyyy  HH:mm:ss a").format(lastUpdated);
}
