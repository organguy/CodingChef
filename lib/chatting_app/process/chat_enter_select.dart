import 'package:coding_chef/chatting_app/screen/chat_login_screen.dart';
import 'package:coding_chef/chatting_app/screen/chat_main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ChatEnterSelect extends StatelessWidget {
  const ChatEnterSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const ChatMainScreen();
          }else{
            return const ChatLoginScreen();
          }
        }
    );
  }
}
