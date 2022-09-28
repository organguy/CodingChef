import 'package:coding_chef/navigator/navigator_named1.dart';
import 'package:coding_chef/navigator/navigator_route1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Select Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LectureButton(title: 'Navigator Route', page: NavigatorRoute1()),
              SizedBox(height: 10,),
              LectureButton(title: 'Navigator Named', page: NavigatorNamed1()),
            ],
          ),
        ),
      ),
    );
  }
}

class LectureButton extends StatelessWidget {

  final String title;
  final Widget page;

  const LectureButton({required this.title, required this.page, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(60),
        ),
        onPressed:() => Get.to(page),
        child: Text(title, style: const TextStyle(fontSize: 20),)
    );
  }
}





