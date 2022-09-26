import 'package:coding_chef/firestore/firestore_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({Key? key}) : super(key: key);

  @override
  State<FirebaseLogin> createState() => _LoginPageState();
}

class _LoginPageState extends State<FirebaseLogin> {

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50.0)),
              const Center(
                child: Image(
                  image: AssetImage('assets/chef.gif'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0)
                          )
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: idController,
                              decoration:
                                  const InputDecoration(labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: pwController,
                              decoration:
                                  const InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                    onPressed: () {
                                     login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orangeAccent),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 45.0,
                                    )
                                )
                            )
                          ],
                        ),
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async{
    var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: 'test@email.com', password: '1234567');

    if(!mounted){
      return;
    }

    if(userCredential.user != null){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirestorePage()
            )
        );
    }else{
      showSnackBar(context, 1);
    }
  }

  void showSnackBar(BuildContext context, int type){

    String msg = '';

    switch(type){
      case 1:
        msg = '로그인 정보를 다시 확인하세요.';
        break;
      case 2:
        msg = '비밀번호가 일치하지 않습니다.';
        break;
      case 3:
        msg = '해당 아이디를 찾을 수 없습니다.';
        break;
    }

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
}
