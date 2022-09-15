import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/dice$leftDice.png')),
                  const SizedBox(width: 20.0,),
                  Expanded(child: Image.asset('assets/dice$rightDice.png'))
                ],
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
                minWidth: 100.0,
                height: 60.0,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        leftDice = Random().nextInt(6) + 1;
                        rightDice = Random().nextInt(6) + 1;
                      });

                      showToast("Left dice : $leftDice, Right dice : $rightDice");

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50.0,
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
  );
}
