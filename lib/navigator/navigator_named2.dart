import 'package:flutter/material.dart';

class NavigatorNamed2 extends StatelessWidget {
  const NavigatorNamed2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Named 2'),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Center(
              child: Text('Named 2')
          )),
    );
  }
}