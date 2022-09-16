
import 'package:flutter/cupertino.dart';

List<int> lottoNumber(){
  var number = (List.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);

  debugPrint('당첨번호');
  debugPrint(number.toString());

  return number;
}

List<int> myNumber(){
  var number2 = (List.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);

  debugPrint('추첨번호');
  debugPrint(number2.toString());

  return number2;
}

void checkNumber(List<int> number, List<int> number2){
  int match = 0;

  for(int lotto in number){
    for(int myNum in number2){
      if(lotto == myNum){
        match++;
        debugPrint('당첨번호: $lotto');
      }
    }
  }

  debugPrint('$match개의 당첨번호가 있습니다!');
}

void main(){
  List<int> lottoFinal = lottoNumber();
  List<int> myFinal = myNumber();
  checkNumber(lottoFinal, myFinal);
}