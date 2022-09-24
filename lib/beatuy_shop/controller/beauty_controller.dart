import 'package:coding_chef/beatuy_shop/data/beauty_service.dart';
import 'package:coding_chef/beatuy_shop/model/beauty_model.dart';
import 'package:get/get.dart';


class BeautyController extends GetxController{
  var productList = <BeautyProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async{
    var products = await BeautyServices.fetchProducts();
    if(products != null){
      productList.value = products;
    }
  }
}