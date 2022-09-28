import 'package:flutter/material.dart';

class NavigatorRoute2 extends StatelessWidget {
  const NavigatorRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Route2'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'Go to the First Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }
}