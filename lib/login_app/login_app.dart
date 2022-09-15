import 'package:coding_chef/login_app/login_buttons.dart';
import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _initBody(),
    );
  }

  Padding _initBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginButtons(
              image: Image.asset('assets/glogo.png'),
              text: const Text(
                'Login with Google',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0
                ),
              ),
              color: Colors.white,
              radius: 4.0,
              onPressed: (){}
          ),
          const SizedBox(height: 10.0,),
          LoginButtons(
              image: Image.asset('assets/flogo.png'),
              text: const Text(
                'Login with Facebook',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0
                ),
              ),
              color: Colors.blueAccent,
              radius: 4.0,
              onPressed: (){}
          ),
          const SizedBox(height: 10.0,),
          LoginButtons(
              image: const Icon(Icons.mail),
              text: const Text(
                'Login with Email',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0
                ),
              ),
              color: Colors.green,
              radius: 4.0,
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}
