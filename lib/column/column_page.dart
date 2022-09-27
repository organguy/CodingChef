import 'package:coding_chef/column/column_page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'column_page2.dart';
import 'column_page3.dart';
import 'column_page4.dart';
import 'column_page5.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Select Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: const [
              LectureButton(title: 'Column 1', page: ColumnPage1()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column 2', page: ColumnPage2()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column 3', page: ColumnPage3()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column 4', page: ColumnPage4()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column 5', page: ColumnPage5()),
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







