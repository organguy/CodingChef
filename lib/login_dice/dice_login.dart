import 'package:coding_chef/login_dice/dice_page.dart';
import 'package:flutter/material.dart';

class DiceLogin extends StatefulWidget {
  const DiceLogin({Key? key}) : super(key: key);

  @override
  State<DiceLogin> createState() => _DiceLoginState();
}

class _DiceLoginState extends State<DiceLogin> {

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
                                      if(idController.text == 'dice' && pwController.text == '1234'){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const DicePage()
                                            )
                                        );
                                      }else if(idController.text == 'dice' && pwController.text != '1234'){
                                        showSnackBar(context, 2);
                                      }else if(idController.text != 'dice' && pwController.text == '1234'){
                                        showSnackBar(context, 3);
                                      }else{
                                        showSnackBar(context, 1);
                                      }
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
