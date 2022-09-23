import 'package:coding_chef/shopping_app/model/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController{

  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async{
    await Future.delayed(Duration(seconds: 2));
    var productList = [
      Product(id: 1, name: 'Mouse', desc: 'Description for Mouse', price: 30),
      Product(id: 2, name: 'Keyboard', desc: 'Description for Keyboard', price: 40),
      Product(id: 3, name: 'Monitor', desc: 'Description for Monitor', price: 620),
      Product(id: 4, name: 'RAM', desc: 'Description for RAM', price: 80),
      Product(id: 5, name: 'Speaker', desc: 'Description for Speaker', price: 120.5),
    ];

    products.assignAll(productList);
  }
}