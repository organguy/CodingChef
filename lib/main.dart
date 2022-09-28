import 'package:coding_chef/appbar/appbar_page.dart';
import 'package:coding_chef/buttons/buttons_page.dart';
import 'package:coding_chef/chatting_app/process/chat_enter_select.dart';
import 'package:coding_chef/chatting_app/screen/chat_login_screen.dart';
import 'package:coding_chef/column/column_page.dart';
import 'package:coding_chef/container/container_page.dart';
import 'package:coding_chef/firestore/firestore_login.dart';
import 'package:coding_chef/future/future_test_page.dart';
import 'package:coding_chef/get_x/getx_page.dart';
import 'package:coding_chef/get_x/login/controller/auth_controller.dart';
import 'package:coding_chef/key/key_page.dart';
import 'package:coding_chef/listview/listview_page.dart';
import 'package:coding_chef/login_dice/dice_login.dart';
import 'package:coding_chef/navigator/navigator_named1.dart';
import 'package:coding_chef/navigator/navigator_named2.dart';
import 'package:coding_chef/navigator/navigator_named3.dart';
import 'package:coding_chef/navigator/navigator_page.dart';
import 'package:coding_chef/on_boarding/onboarding_page.dart';
import 'package:coding_chef/reponsive/responsive_layout.dart';
import 'package:coding_chef/reponsive/responsive_page.dart';
import 'package:coding_chef/row/row_page.dart';
import 'package:coding_chef/snackbar/snackbar_page.dart';
import 'package:coding_chef/stateful_widget/stateful_page.dart';
import 'package:coding_chef/stream/stream_page.dart';
import 'package:coding_chef/toast/toast_page.dart';
import 'package:coding_chef/weather_app/weather_loading.dart';
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
              SizedBox(height: 10,),
              LectureButton(title: 'Button Widget', page: ButtonsPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'OnBoarding', page: OnBoardingPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'ListView', page: ListViewPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Responsive Layout', page: ResponsivePage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Stateful Widget', page: StatefulPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Keys', page: KeyPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Stream', page: StreamPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Login Dice App', page: DiceLogin()),
              SizedBox(height: 10,),
              LectureButton(title: 'Future Async', page: FutureTestPage()),
              SizedBox(height: 10,),
              LectureButton(title: 'Weather App', page: WeatherLoading()),
              SizedBox(height: 10,),
              LectureButton(title: 'Chatting App', page: ChatEnterSelect()),
              SizedBox(height: 10,),
              LectureButton(title: 'FireStore', page: FirebaseLogin()),
              SizedBox(height: 10,),
              LectureButton(title: 'GetX', page: GetxPage()),
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
        onPressed:() {
          Get.to(page);
        },
        child: Text(title, style: const TextStyle(fontSize: 20),)
    );
  }
}
