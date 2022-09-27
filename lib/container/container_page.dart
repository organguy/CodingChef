import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Widget'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          padding: const EdgeInsets.all(20),
          child: const Text('hello'),
        )
      ),
    );
  }
}
