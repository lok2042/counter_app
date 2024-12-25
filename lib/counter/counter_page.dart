import 'package:counter_app/counter/counter_actions.dart';
import 'package:counter_app/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CounterPage extends StatelessWidget {
  final Store<CounterState> store;
  final String title;

  const CounterPage({
    super.key,
    required this.store,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StoreConnector<CounterState, int>(
                converter: (store) => store.state.count,
                builder: (context, count) {
                  return Column(
                    spacing: 10,
                    children: [
                      Text(
                        count.toString(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Last Updated: ${store.state.lastUpdatedFormatted}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            StoreConnector<CounterState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.increment);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                );
              },
            ),
            StoreConnector<CounterState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.decrement);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                );
              },
            ),
            StoreConnector<CounterState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.reset);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Reset',
                  child: Icon(Icons.restore),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
