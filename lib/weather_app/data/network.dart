
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async{
    Uri weatherUri = Uri.parse(url);
    http.Response response = await http.get(weatherUri);

    if(response.statusCode == 200) {
      String jsonData = response.body;
      var weatherJson = jsonDecode(jsonData);
      return weatherJson;
    }
  }
}