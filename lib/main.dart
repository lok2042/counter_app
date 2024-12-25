import 'package:counter_app/counter/counter_page.dart';
import 'package:counter_app/counter/counter_reducers.dart';
import 'package:counter_app/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store<CounterState>(
      counterReducer,
      initialState: CounterState(0, DateTime.now()),
    );

    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterPage(
        title: 'Counter with Redux',
        store: store,
      ),
    );
  }
}
