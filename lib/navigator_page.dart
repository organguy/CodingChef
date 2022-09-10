import 'package:flutter/material.dart';

class NavigatorPage1 extends StatelessWidget {
  const NavigatorPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page1'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NavigatorPage2()));
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

class NavigatorPage2 extends StatelessWidget {
  const NavigatorPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page2'),
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

class NavigatorPageA extends StatelessWidget {
  const NavigatorPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page A'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/b');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text(
                    'Go to Screen B',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/c');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text(
                    'Go to Screen C',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class NavigatorPageB extends StatelessWidget {
  const NavigatorPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page A'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Text('Screen B')
          )),
    );
  }
}

class NavigatorPageC extends StatelessWidget {
  const NavigatorPageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page A'),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Center(
              child: Text('Screen C')
          )),
    );
  }
}