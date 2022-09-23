import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({Key? key}) : super(key: key);

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {

  CollectionReference product = FirebaseFirestore.instance.collection('items');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    nameController.text = documentSnapshot['name'];
    priceController.text = documentSnapshot['price'];

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context){
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name'
                    ),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                        labelText: 'Price'
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final String name = nameController.text;
                      final String price = priceController.text;
                      await product.doc(documentSnapshot.id).update({
                        "name" : name,
                        "price" : price
                      });
                      nameController.text = "";
                      priceController.text = "";

                      if(mounted){
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Update')
                  )
                ],
              ),
            ),
          );
      }
    );
  }

  Future<void> _create() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name'
                    ),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                        labelText: 'Price'
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final String name = nameController.text;
                        final String price = priceController.text;
                        await product.add({
                          "name" : name,
                          "price" : price
                        });
                        nameController.text = "";
                        priceController.text = "";

                        if(mounted){
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Update')
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void showDeleteCompleteSnackBar(){

    String msg = 'You have successfully deleted a product!';

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg,
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blue,
        )
    );
  }

  Future<void> _delete(String productId) async {
    await product.doc(productId).delete();
    showDeleteCompleteSnackBar();
  }

  void _showDeleteConfirmAlert(String productId){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Do you really want to delete selected item?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL')
          ),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                _delete(productId);
              },
              child: const Text('DELETE')
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          _create();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (context, streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              _update(documentSnapshot);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: (){
                              _showDeleteConfirmAlert(documentSnapshot.id);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
