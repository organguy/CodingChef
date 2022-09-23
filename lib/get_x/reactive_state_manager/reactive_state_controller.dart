import 'package:coding_chef/models/person2.dart';
import 'package:get/get.dart';

class ReactiveStateController extends GetxController{
  final person = Person2().obs;

  void updateInfo(){
    person.update((val) {
      val?.age++;
      val?.name = 'Organguy';
    });
  }
}