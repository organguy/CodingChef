import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KeyUniquePage extends StatefulWidget {
  const KeyUniquePage({Key? key}) : super(key: key);

  @override
  State<KeyUniquePage> createState() => _KeyUniquePageState();
}

class _KeyUniquePageState extends State<KeyUniquePage> {
  List<Widget> tiles = [
    StatefulColorfulTile(key: UniqueKey(),),
    StatefulColorfulTile(key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          swapTiles();
          flutterToast();
        },
        child: const Icon(Icons.double_arrow_rounded),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

Color getRandomColor() {
  var r = Random();
  return Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255));
}

flutterToast() {
  Fluttertoast.showToast(
      msg: 'color has been changed!!!',
      gravity: ToastGravity.BOTTOM_LEFT,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
  );
}
