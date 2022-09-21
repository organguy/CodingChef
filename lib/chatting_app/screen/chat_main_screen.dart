import 'package:coding_chef/chatting_app/chatting/chat/message.dart';
import 'package:coding_chef/chatting_app/chatting/chat/new_message.dart';
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
          }, icon: const Icon(
            Icons.exit_to_app_sharp,
            color: Colors.white,
          ))
        ],
      ),
      body: Column(
        children: const [
          Expanded(
              child: Messages()
          ),
          NewMessages()
        ],
      )
    );
  }
}
