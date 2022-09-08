import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              color: Colors.white,
              child: const Text('Container 1'),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Container 2'),
            ),
            Container(
              height: 100,
              color: Colors.red,
              child: const Text('Container 3'),
            ),
          ],
        ),
      ),
    );
  }
}
