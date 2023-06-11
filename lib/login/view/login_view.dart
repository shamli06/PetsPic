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
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                hintText: 'Enter Name',
                ),
                onChanged: (value){
                  controller.name.value = value;
                  controller.update();
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value){
                  if(value.length == 10){
                    controller.contact.value = value;
                    controller.update();
                  }else{
                    controller.contact.value = "";
                  }
                  },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact',
                    hintText: 'Enter contact no.',
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
                onPressed: () async{
                  String name = await controller.getName() ??"";
                  String contact = await controller.getContact()??"";
                  print(contact);
                  print(controller.contact.value);
                  print(controller.name.value==name);
                  print(controller.contact.value == contact);
                  if(controller.name.value.isNotEmpty && controller.contact.value.isNotEmpty&&
                      controller.name.value==name&& controller.contact.value == contact){
                    print("a");
                    Get.offNamed(Routes.home);
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
