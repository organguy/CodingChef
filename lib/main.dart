import 'package:coding_chef/appbar_page.dart';
import 'package:coding_chef/buttons_page.dart';
import 'package:coding_chef/chatting_app/process/chat_enter_select.dart';
import 'package:coding_chef/chatting_app/screen/chat_main_screen.dart';
import 'package:coding_chef/column_page.dart';
import 'package:coding_chef/container_page.dart';
import 'package:coding_chef/future_test_page.dart';
import 'package:coding_chef/key_global_page.dart';
import 'package:coding_chef/key_unique_page.dart';
import 'package:coding_chef/key_value_page.dart';
import 'package:coding_chef/listview_page.dart';
import 'package:coding_chef/listview_person.dart';
import 'package:coding_chef/login_app/login_app.dart';
import 'package:coding_chef/login_dice/login_page.dart';
import 'package:coding_chef/navigator_page.dart';
import 'package:coding_chef/responsive_page.dart';
import 'package:coding_chef/row_page.dart';
import 'package:coding_chef/snackbar_page.dart';
import 'package:coding_chef/stream_page.dart';
import 'package:coding_chef/toast_page.dart';
import 'package:coding_chef/weather_app/weather_app.dart';
import 'package:coding_chef/weather_app/weather_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chatting_app/screen/chat_login_screen.dart';
import 'grade_page.dart';
import 'onboarding_page.dart';
import 'stateful_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: ChatEnterSelect(),
    );
  }
}
