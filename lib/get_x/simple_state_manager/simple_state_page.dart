import 'package:coding_chef/get_x/simple_state_manager/simple_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleStatePage extends StatelessWidget {
  const SimpleStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Simple State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<SimpleStateController>(
              init: SimpleStateController(),
              builder: (_) => Text(
                'Current value is : ${Get.find<SimpleStateController>().x}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red
                ),
              )
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<SimpleStateController>().increment();
              },
              child: const Text('Add number')
            )
          ],
        ),
      ),
    );
  }
}
