import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showToast('Text button');
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text(
                'Text button',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showToast('Elevated button');
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 0.0),
              child: const Text('Elevated button'),
            ),
            OutlinedButton(
              onPressed: () {
                showToast('Outlined Button');
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent, width: 2.0),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.green),
              child: const Text('Outlined button'),
            ),
            TextButton.icon(
              onPressed: () {
                showToast('Text Icon button');
              },
              icon: const Icon(
                Icons.home,
                size: 30.0,
                color: Colors.black87,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                  backgroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showToast('Elevated Icon Button');
              },
              icon: const Icon(
                Icons.home,
                size: 20.0,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.orangeAccent,
                  minimumSize: const Size(200, 50)),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.home),
              label: const Text('Go to Home'),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent, width: 2.0),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              onPressed: null, // disabled
              icon: const Icon(
                Icons.home,
                size: 20.0,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.orangeAccent,
                  disabledBackgroundColor: Colors.grey
              )
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: const EdgeInsets.all(20.0),
              children: [
                TextButton(onPressed: (){}, child: const Text('TextButton')),
                ElevatedButton(onPressed: (){}, child: const Text('ElevatedButton'))
              ],
            )
          ],
        ),
      ),
    );
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM_LEFT,
        backgroundColor: Colors.redAccent,
        fontSize: 20.0,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }
}
