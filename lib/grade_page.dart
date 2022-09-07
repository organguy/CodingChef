
import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/bird.gif'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[500],
              thickness: 0.5,
            ),
            const Text(
              'NAME',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'BBANTO',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'BBANTO POWER LEVEL',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              '10',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                SizedBox(
                  width: 10.0,
                ),
                Text('using lightsaber'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                SizedBox(
                  width: 10.0,
                ),
                Text('hero face tattoo'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                SizedBox(
                  width: 10.0,
                ),
                Text('fire flames'),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/icon.png'),
                radius: 40.0,
                backgroundColor: Colors.amber[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}