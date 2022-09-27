import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Toast'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: TextButton(
            onPressed: () => showToast(),
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

  showToast() {
    Fluttertoast.showToast(
        msg: 'Flutter',
        gravity: ToastGravity.BOTTOM_LEFT,
        backgroundColor: Colors.redAccent,
        fontSize: 20.0,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT
    );
  }
}
