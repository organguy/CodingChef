import 'package:coding_chef/column/column_page1.dart';
import 'package:coding_chef/get_x/beatuy_shop/view/beauty_shop_page.dart';
import 'package:coding_chef/get_x/login/view/login_page.dart';
import 'package:coding_chef/get_x/reactive_state_manager/reactive_state_page.dart';
import 'package:coding_chef/get_x/simple_state_manager/simple_state_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GetxPage extends StatelessWidget {
  const GetxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Select Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const LectureButton(title: 'Simple State', page: SimpleStatePage()),
              const SizedBox(height: 10,),
              LectureButton(title: 'Reactive State', page: ReactiveStatePage()),
              const SizedBox(height: 10,),
              const LectureButton(title: 'Login', page: LoginPage()),
              const SizedBox(height: 10,),
              LectureButton(title: 'Beauty Shop', page: BeautyShopPage()),
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







