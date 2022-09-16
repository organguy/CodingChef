import 'package:flutter/cupertino.dart';

Future<String> createOrderMessage() async{
  debugPrint('synchronous');
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder(){
  return Future.delayed(
      const Duration(seconds: 2),
          () => 'Large Latte'
  );
}

void main() async{
  debugPrint('Fetching user order...');
  debugPrint(await createOrderMessage());
}