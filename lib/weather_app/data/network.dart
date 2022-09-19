
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String url;
  final String url2;
  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async{
    Uri weatherUri = Uri.parse(url);
    http.Response response = await http.get(weatherUri);

    if(response.statusCode == 200) {
      String jsonData = response.body;
      var weatherJson = jsonDecode(jsonData);
      return weatherJson;
    }
  }

  Future<dynamic> getAirData() async{
    Uri airUri = Uri.parse(url2);
    http.Response response = await http.get(airUri);

    if(response.statusCode == 200) {
      String jsonData = response.body;
      var airJson = jsonDecode(jsonData);
      return airJson;
    }
  }
}