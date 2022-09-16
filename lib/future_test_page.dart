import 'package:flutter/material.dart';

class FutureTestPage extends StatefulWidget {
  const FutureTestPage({Key? key}) : super(key: key);

  @override
  State<FutureTestPage> createState() => _FutureTestPageState();
}

class _FutureTestPageState extends State<FutureTestPage> {
  String result = 'no data found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Test'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    futureTest();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Future Test',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
              ),
              const Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              FutureBuilder(
                future: myFuture(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Text(
                      snapshot.data!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue
                      ),
                    );
                  }else{
                    return const CircularProgressIndicator();
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> futureTest() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      debugPrint('Here comes second');

      setState(() {
        result = 'The data is fetched';
        debugPrint(result);
        debugPrint('Here comes third');
      });
    });

    debugPrint('Here comes first');
    debugPrint('Here is the last one');
  }

  Future<String> myFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'another Future completed';
  }
}
