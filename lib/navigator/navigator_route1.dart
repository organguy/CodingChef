
import 'package:coding_chef/navigator/navigator_route2.dart';
import 'package:flutter/material.dart';

class NavigatorRoute1 extends StatelessWidget {
  const NavigatorRoute1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Route1'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavigatorRoute2()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'Go to the Second Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }
}