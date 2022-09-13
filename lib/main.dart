import 'package:coding_chef/appbar_page.dart';
import 'package:coding_chef/buttons_page.dart';
import 'package:coding_chef/column_page.dart';
import 'package:coding_chef/container_page.dart';
import 'package:coding_chef/listview_page.dart';
import 'package:coding_chef/listview_person.dart';
import 'package:coding_chef/navigator_page.dart';
import 'package:coding_chef/responsive_page.dart';
import 'package:coding_chef/row_page.dart';
import 'package:coding_chef/snackbar_page.dart';
import 'package:coding_chef/toast_page.dart';
import 'package:flutter/material.dart';
import 'grade_page.dart';
import 'onboarding_page.dart';
import 'stateful_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => NavigatorPageA(),
        '/b' : (context) => NavigatorPageB(),
        '/c' : (context) => NavigatorPageC()

      },*/
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: StatefulPage(),
    );
  }
}
