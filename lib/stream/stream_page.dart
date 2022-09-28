import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {

  final int price = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder'),
      ),
      body: StreamBuilder<int>(
        initialData: price,
        stream: addStreamValue(),
        builder: (context, snapshot){
          final priceNumber = snapshot.data.toString();
          return Center(
            child: Text(
              priceNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.blue
              ),
            ),
          );
        },
      ),
    );
  }

  Stream<int> addStreamValue(){
    return Stream<int>.periodic(
      const Duration(seconds: 1),
            (count) => price + count
    );
  }
}
