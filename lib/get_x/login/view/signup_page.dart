import 'package:coding_chef/get_x/login/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var nameController = TextEditingController();
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
                  const Icon(Icons.card_travel_outlined, color: Colors.deepPurple, size: 100,),
                  const SizedBox(height: 30,),
                  Text('Sign Up', style: GoogleFonts.bebasNeue(fontSize: 36.0),),
                  const SizedBox(height: 10,),
                  Text('Thank you for join us', style: GoogleFonts.bebasNeue(fontSize: 28),),
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
                          controller: nameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name'
                          ),
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
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email'
                          ),
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  if(AuthController.instance.isProgress.isFalse)
                  Obx(() {
                      if (!AuthController.instance.isProgress.value) {
                        return GestureDetector(
                          onTap: () {
                            AuthController.instance.register(
                                nameController.text.trim(),
                                emailController.text.trim(),
                                pwController.text.trim());
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
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
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already registered?'),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Text(
                          ' Go back Login page!',
                          style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold
                          ),
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
