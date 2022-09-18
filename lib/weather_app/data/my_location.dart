import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class MyLocation{
  late double latitude;
  late double longitude;

  Future<void> getMyCurrentLocation() async{
    try{
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      debugPrint(latitude.toString());
      debugPrint(longitude.toString());
    }catch(e){
      debugPrint('There was a problem with the internet connection.');
    }
  }
}