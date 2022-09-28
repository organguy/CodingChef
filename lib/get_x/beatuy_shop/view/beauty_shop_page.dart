import 'package:coding_chef/get_x/beatuy_shop/controller/beauty_controller.dart';
import 'package:coding_chef/get_x/beatuy_shop/view/beatuy_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeautyShopPage extends StatelessWidget {
  BeautyShopPage({Key? key}) : super(key: key);

  final beautyController = Get.put(BeautyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.view_list_rounded)
          ),
          IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Obx(() {
          if(!beautyController.isLoadedData.value){
            return const Center(
                child: CircularProgressIndicator()
            );
          }else{
            return GridView.builder(
                itemCount: beautyController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemBuilder: (context, index){
                  return BeautyTile(beautyController.productList[index]);
                }
            );
          }
        }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        label: Obx(() => Text(
            'Item : ${beautyController.cartItemCount.value}',
            style: const TextStyle(
              fontSize: 16
            ),
          ),
        ),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
