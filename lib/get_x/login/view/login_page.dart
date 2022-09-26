import 'package:coding_chef/get_x/login/controller/auth_controller.dart';
import 'package:coding_chef/get_x/login/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var pwController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_android, size: 100,),
                const SizedBox(height: 30,),
                Text('Hello', style: GoogleFonts.bebasNeue(fontSize: 36.0),),
                const SizedBox(height: 10,),
                const Text('Welcome back', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: pwController,
                        obscureText: true,
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Obx(() {
                    if(!AuthController.instance.isProgress.value){
                      return GestureDetector(
                        onTap: (){
                          AuthController.instance.login(emailController.text.trim(), pwController.text.trim());
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a memeber?'),
                    GestureDetector(
                      onTap: () => Get.to(() => const SignupPage()),
                      child: const Text(
                        ' Register Now!',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
