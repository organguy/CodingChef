import 'package:coding_chef/listview/listview_job.dart';
import 'package:coding_chef/listview/listview_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Select Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LectureButton(title: 'ListView Job', page: ListViewJob()),
              SizedBox(height: 10,),
              LectureButton(title: 'ListView Person', page: ListViewPerson()),
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





