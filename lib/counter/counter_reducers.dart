import 'package:counter_app/counter/counter_actions.dart';
import 'package:counter_app/counter/counter_state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action == CounterActions.increment) {
    return CounterState(state.count + 1, DateTime.now());
  } else if (action == CounterActions.decrement) {
    return CounterState(state.count - 1, DateTime.now());
  } else if (action == CounterActions.reset) {
    return CounterState(0, DateTime.now());
  } else {
    return state;
  }
}
