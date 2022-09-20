import 'package:flutter/material.dart';

class KeyGlobalPage extends StatelessWidget {

  const KeyGlobalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final counterKey = GlobalKey<_CounterState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key'),
      ),
      body: Center(
        child: Counter(key: counterKey),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterKey.currentState!.increment();
          debugPrint(counterKey.currentState!.count.toString());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Count number: $count',
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}
