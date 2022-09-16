import 'package:flutter/cupertino.dart';

methodA(){
  debugPrint('A');
}

methodB() async{
  debugPrint('B start');
  await methodC('B');
  debugPrint('B end');
}

methodC(String from) async{
  debugPrint('C start from $from');

  Future((){
    debugPrint('C running Future from $from');
  }).then((_){
    debugPrint('C end of Future from $from');
  });

  debugPrint('C end from $from');
}

methodD(){
  debugPrint('D');
}

void main() async{
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}