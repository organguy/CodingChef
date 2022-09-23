import 'package:get/get.dart';

class SimpleStateController extends GetxController{

  int _x = 0;

  int get x => _x;

  set x(int x){
    _x = x;
  }

  void increment(){
    x++;
    update();
  }
}