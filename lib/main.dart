import 'package:coding_chef/appbar_page.dart';
import 'package:coding_chef/snackbar_page.dart';
import 'package:flutter/material.dart';
import 'grade_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: SnackBarPage(),
    );
  }
}
