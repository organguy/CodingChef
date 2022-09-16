

import 'dart:math';

import 'package:flutter/cupertino.dart';

List<int> lottoNumber(){

  var random = Random();
  List<int> lottoList = [];
  int num;

  for(int i = 0; i < 6; i++){
    num = random.nextInt(45) + 1;
    lottoList.add(num);
  }

  debugPrint('당첨번호');
  debugPrint(lottoList.toString());

  return lottoList;
}

List<int> myNumber(){

  var random = Random();
  List<int> myList = [];
  int num;

  for(int i = 0; i < 6; i++){
    num = random.nextInt(45) + 1;
    myList.add(num);
  }

  debugPrint('내 추첨번호');
  debugPrint(myList.toString());

  return myList;
}

void checkNumber(List<int> lottoList, List<int> myList){

  int match = 0;

  for(int lotto in lottoList){
    for(int myNum in myList){
      if(lotto == myNum){
        match++;
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