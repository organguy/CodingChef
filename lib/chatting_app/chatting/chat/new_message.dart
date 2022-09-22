import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {

  final _controller = TextEditingController();
  String _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: TextField(
            maxLines: null,
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Send a message...'
            ),
            onChanged: (value){
              setState(() {
                _userEnterMessage = value;
              });
            },
          )),
          IconButton(
              onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
              icon: const Icon(Icons.send),
              color: Colors.blue,
          )
        ],
      ),
    );
  }

  void _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('user').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add(
      {
        'text' : _userEnterMessage,
        'time' : Timestamp.now(),
        'userID' : user!.uid,
        'userName' : userData['userName'],
        'userImage' : userData['picked_image']
      }
    );
    _controller.clear();
  }
}
