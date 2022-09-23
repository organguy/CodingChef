import 'package:coding_chef/shopping_app/controller/cart_controller.dart';
import 'package:coding_chef/shopping_app/controller/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index){
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].name,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(controller.products[index].desc),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: (){
                                cartController.addToItem(controller.products[index]);
                              },
                              child: const Text('Add to cart')
                            )
                          ],
                        ),
                      ),
                    );
                  }
                );
              }
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white
                ),
              );
            }
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.count.toString(),
              style: const TextStyle(
                fontSize: 20
              ),
            );
          }
        ),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
