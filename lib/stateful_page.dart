import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Page'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: const EdgeInsets.all(30.0),
              children: [
                FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 30,
                    )),
                FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
