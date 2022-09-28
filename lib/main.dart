import 'package:coding_chef/appbar/appbar_page.dart';
import 'package:coding_chef/column/column_page.dart';
import 'package:coding_chef/container/container_page.dart';
import 'package:coding_chef/navigator/navigator_named1.dart';
import 'package:coding_chef/navigator/navigator_named2.dart';
import 'package:coding_chef/navigator/navigator_named3.dart';
import 'package:coding_chef/navigator/navigator_page.dart';
import 'package:coding_chef/row/row_page.dart';
import 'package:coding_chef/snackbar/snackbar_page.dart';
import 'package:coding_chef/toast/toast_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welocem/grade_page.dart';
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

    return GetMaterialApp(
      routes: {
        '/1' : (context) => NavigatorNamed1(),
        '/2' : (context) => NavigatorNamed2(),
        '/3' : (context) => NavigatorNamed3()
      },
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: Scaffold(
        body: initBody(),
      ),
    );

    /*return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => NavigatorPageA(),
        '/b' : (context) => NavigatorPageB(),
        '/c' : (context) => NavigatorPageC()

      },*/
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                FishModel(name: 'Salmon', number: 10, size: 'big')
        ),
        ChangeNotifierProvider(
            create: (context) =>
                SeaFishModel(name: 'Salmon', tunaNumber: 0, size: 'middle')
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BBANTO',
        home: FishOrder(),
      ),
    );*/
  }

  SingleChildScrollView initBody() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: const [
              LectureButton(title: 'Welcome Flutter', page: Grade()),
              SizedBox(height: 10,),
              LectureButton(title: 'AppBar & Drawer', page: AppbarPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'SnackBar', page: SnackBarPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Toast', page: ToastPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Container Widget', page: ContainerPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column Widget', page: ColumnPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Column Widget', page: RowPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Navigator', page: NavigatorPage()),
            ],
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
