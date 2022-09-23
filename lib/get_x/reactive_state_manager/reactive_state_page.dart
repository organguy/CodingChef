import 'package:coding_chef/get_x/reactive_state_manager/reactive_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveStatePage extends StatelessWidget {
  ReactiveStatePage({Key? key}) : super(key: key);
  final ReactiveStateController controller = Get.put(ReactiveStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyanAccent
              ),
              child: Center(
                child: GetX<ReactiveStateController>(
                  builder: (_) => Text(
                    'Name: ${controller.person().name}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyanAccent
              ),
              child: Center(
                child: Obx(
                    () => Text(
                      'Age: ${controller.person().age}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyanAccent
              ),
              child: Center(
                child: GetX(
                  init: ReactiveStateController(),
                  builder: (control) => Text(
                    'Age: ${control.person().age}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.updateInfo();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
