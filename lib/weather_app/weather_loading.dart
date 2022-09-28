import 'package:coding_chef/weather_app/data/network.dart';
import 'package:coding_chef/weather_app/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'data/my_location.dart';

class WeatherLoading extends StatefulWidget {
  const WeatherLoading({Key? key}) : super(key: key);

  @override
  State<WeatherLoading> createState() => _WeatherLoadingState();
}

class _WeatherLoadingState extends State<WeatherLoading> {

  late double latitude;
  late double longitude;
  final String apiKey = '5f758300e761c3075a11e6de677eb743';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
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

    String weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    String airUrl = 'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude&lon=$longitude&appid=$apiKey';

    debugPrint(weatherUrl);
    debugPrint(airUrl);
    
    Network network = Network(weatherUrl, airUrl);
    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    debugPrint(weatherData.toString());
    debugPrint(airData.toString());

    if (!mounted || weatherData == null){
      showToast('API 호출이 정상적이지 않습니다.');
      return;
    }

    Get.off(
        WeatherApp(
            parseWeatherData: weatherData,
            parseAirData: airData
        )
    );
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM_LEFT,
        backgroundColor: Colors.redAccent,
        fontSize: 20.0,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT
    );
  }
}
