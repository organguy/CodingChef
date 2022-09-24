import 'package:coding_chef/beatuy_shop/controller/beauty_controller.dart';
import 'package:coding_chef/beatuy_shop/view/beatuy_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeautyShopPage extends StatelessWidget {
  BeautyShopPage({Key? key}) : super(key: key);

  final beautyController = Get.put(BeautyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beatuy Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.view_list_rounded)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Obx(() => GridView.builder(
            itemCount: beautyController.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            itemBuilder: (context, index){
              return BeautyTile(beautyController.productList[index]);
            })
          ),
        ),
      ),
    );
  }
}
