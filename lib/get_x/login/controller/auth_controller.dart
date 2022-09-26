import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_chef/get_x/login/view/login_page.dart';
import 'package:coding_chef/get_x/login/view/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  var isProgress =false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user){
    if(user == null){
      Get.offAll(()=> const LoginPage());
    }else{
      Get.offAll(()=> const WelcomePage());
    }
  }

  void register(String userName, String email, String password) async{

    isProgress.value = true;

    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('user')
          .doc(_user.value!.uid)
          .set({
            'userName' : userName,
          });
      isProgress.value = false;
    }catch(e){
      isProgress.value = false;
      Get.snackbar(
        'Error message',
        'User message',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Regstration is failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        )
      );
    }
  }

  void login(String email, String password) async{

    isProgress.value = true;

    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isProgress.value = false;
    }catch(e){
      isProgress.value = false;
      Get.snackbar(
          'Error message',
          'User message',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Login is failed',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          )
      );
    }
  }

  void logout(){
    auth.signOut();
  }
}