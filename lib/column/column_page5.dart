

import 'package:flutter/material.dart';

class ColumnPage5 extends StatelessWidget {
  const ColumnPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Page5'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              color: Colors.yellow,
              child: const Text('Container 1'),
            ),
            const SizedBox(
              height: 30.0,
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