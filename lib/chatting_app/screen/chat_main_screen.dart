import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {

  final _auth = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user != null){
        loggedUser = user;
        debugPrint(loggedUser!.email.toString());
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut();
            Navigator.pop(context);
          }, icon: const Icon(
            Icons.exit_to_app_sharp,
            color: Colors.white,
          ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chats/Z5Oof5YJ1XN3C0HdhVAk/message').snapshots(),
        builder: (context, snapshot){
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  docs[index]['text'],
                  style: const TextStyle(fontSize: 20.0),
                ),
              );
            }
          );
        },
      )
    );
  }
}
