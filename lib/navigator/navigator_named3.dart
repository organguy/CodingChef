import 'package:flutter/material.dart';

class NavigatorNamed3 extends StatelessWidget {
  const NavigatorNamed3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Named 3'),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Center(
              child: Text('Named 3')
          )),
    );
  }
}