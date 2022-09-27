

import 'package:flutter/material.dart';

class ColumnPage2 extends StatelessWidget {
  const ColumnPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Page2'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: const Text('Container 1'),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Text('Container 2'),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Text('Container 3'),
            )
          ],
        ),
      ),
    );
  }
}