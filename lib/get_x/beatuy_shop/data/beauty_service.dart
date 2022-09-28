
import 'package:coding_chef/get_x/beatuy_shop/model/beauty_model.dart';
import 'package:http/http.dart' as http;

class BeautyServices{
  static var client = http.Client();
  
  static Future<List<BeautyProduct>?> fetchProducts() async{
    Uri uri = Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var jsonData = response.body;
      return productFromJson(jsonData);
    }
    return null;
  }
}