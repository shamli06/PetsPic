import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petspic/login/controller/login_controller.dart';

import '../../constant/images.dart';
import '../../routes/routes.dart';


class LoginView extends StatelessWidget {

  LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child:  Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(Images.launchImage)),
              ),
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                hintText: 'Enter email',
                ),
                onChanged: (value){
                  controller.email.value = value;
                  controller.update();
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                onChanged: (value){
                    controller.password.value = value;
                    controller.update();

                  },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password',
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if(controller.email.value.isNotEmpty && controller.password.value.isNotEmpty
                      ){
                    print("a");
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: controller.email.value, password: controller.password.value).then((value){
                      Get.offNamed(Routes.home, arguments: {"email":controller.email.value});
                    }).onError((error, stackTrace) {
                      Get.snackbar("Error", error.toString(),snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.red);
                    });
                  }else{
                    print("b");
                    Get.snackbar("Error", "Enter valid name or contact",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red);
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: (){
                Get.toNamed(Routes.onboarding);
              },
                child: const Text('New User? Create Account'))
          ],
        ),
      ),
    );
  }
}
