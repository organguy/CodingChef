
import 'dart:math';

import 'package:flutter/cupertino.dart';

Set<int> lottoNumber(){
  final random = Random();
  final Set<int> lottoSet = {};

  while(lottoSet.length != 6){
    lottoSet.add(random.nextInt(45) + 1);
  }

  debugPrint('당첨번호');
  debugPrint(lottoSet.toList().toString());

  return lottoSet;
}

Set<int> myNumber(){
  final random = Random();
  final Set<int> mySet = {};

  while(mySet.length != 6){
    mySet.add(random.nextInt(45) + 1);
  }

  debugPrint('추첨번호');
  debugPrint(mySet.toString());

  return mySet;
}

void checkNumber(Set<int> lottoSet, Set<int> mySet){

  int match = 0;

  for(int lotto in lottoSet){
    for(int myNum in mySet){
      if(lotto == myNum){
        match++;
        debugPrint('당첨번호: $myNum');
      }
    }
  }

  debugPrint('$match개의 당첨번호가 있습니다!');
}

void main(){
  Set<int> lottoFianl = lottoNumber();
  Set<int> myFinal = myNumber();

  checkNumber(lottoFianl, myFinal);
}



