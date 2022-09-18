import 'package:coding_chef/weather_app/data/network.dart';
import 'package:flutter/material.dart';
import 'data/my_location.dart';

class WeatherLoading extends StatefulWidget {
  const WeatherLoading({Key? key}) : super(key: key);

  @override
  State<WeatherLoading> createState() => _WeatherLoadingState();
}

class _WeatherLoadingState extends State<WeatherLoading> {

  late double latitude;
  late double longitude;
  final String weatherUrl = 'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    debugPrint(latitude.toString());
    debugPrint(longitude.toString());
    
    Network network = Network(weatherUrl);
    var weatherData = await network.getJsonData();
    debugPrint(weatherData.toString());
  }
}
