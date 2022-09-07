import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snack Bar'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Hello',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                duration: Duration(milliseconds: 1000),
              ));
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'Show Me',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
        ));
  }
}
