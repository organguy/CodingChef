import 'package:flutter/material.dart';

class KeyValuePage extends StatefulWidget {
  const KeyValuePage({Key? key}) : super(key: key);

  @override
  State<KeyValuePage> createState() => _KeyValuePageState();
}

class _KeyValuePageState extends State<KeyValuePage> {

  bool emailField = true;
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Key'),
        centerTitle: true,
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
                            if(emailField)
                              const TextField(
                                key: ValueKey(1),
                                //controller: idController,
                                decoration:
                                InputDecoration(
                                    labelText: 'Enter "dice"'),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            const TextField(
                              key: ValueKey(2),
                              //controller: pwController,
                              decoration:
                              InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        emailField = false;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orangeAccent,
                                        minimumSize: const Size(150, 50),
                                    ),
                                    child: const Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                      size: 35.0,
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
