import 'package:coding_chef/models/fish_model.dart';
import 'package:coding_chef/models/seafish_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishOrder extends StatelessWidget {
  const FishOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish Order'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Fish name: ${Provider.of<FishModel>(context).name}', style: const TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            const High()
          ],
        ),
      ),
    );
  }
}

class High extends StatelessWidget {
  const High({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('SpicyA is located at high place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyA()
      ],
    );
  }
}

class SpicyA extends StatelessWidget {
  const SpicyA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Fish number: ${Provider.of<FishModel>(context).number}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Fish size: ${Provider.of<FishModel>(context).size}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        const Middle()
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('SpicyB is located at middle place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyB()
      ],
    );
  }
}

class SpicyB extends StatelessWidget {
  const SpicyB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tuna number: ${Provider.of<SeaFishModel>(context).tunaNumber}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Fish size: ${Provider.of<SeaFishModel>(context).size}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        ElevatedButton(
            onPressed: (){
              Provider.of<SeaFishModel>(context, listen: false).changeSeaFishNumber();
            },
            child: const Text('Sea fish number')
        ),
        const Low(),
      ],
    );
  }
}

class Low extends StatelessWidget {
  const Low({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('SpicyC is located at low place', style: TextStyle(fontSize: 16),),
        SizedBox(height: 20,),
        SpicyC()
      ],
    );
  }
}

class SpicyC extends StatelessWidget {
  const SpicyC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Fish number: ${Provider.of<FishModel>(context).number}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        Text('Fish size: ${Provider.of<FishModel>(context).size}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        ElevatedButton(
            onPressed: (){
              Provider.of<FishModel>(context, listen: false).changeFishNumber();
            },
            child: const Text('Change fish number')
        )
      ],
    );
  }
}


