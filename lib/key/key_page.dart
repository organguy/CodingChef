import 'package:coding_chef/key/key_global_page.dart';
import 'package:coding_chef/key/key_unique_page.dart';
import 'package:coding_chef/key/key_value_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyPage extends StatelessWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Select Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LectureButton(title: 'Global Key', page: KeyGlobalPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Unique Key', page: KeyUniquePage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Value Key', page: KeyValuePage()),
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





