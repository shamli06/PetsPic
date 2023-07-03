import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petspic/onboarding/controller/onboarding_controller.dart';
import 'package:petspic/routes/routes.dart';

import '../../models/user_model.dart';

class OnboardingView extends StatelessWidget {

  OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Get.offNamed(Routes.login);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text ("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 20,),
                        Text("Create an Account,Its free",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        const SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          makeInput(label: "Email", type: 'email',email: true),
                          makeInput(label: "Pet's Name", type: 'petsName'),
                          makeInput(label: "Pet's Breed", type: 'petsBreed'),
                          makeInput(label: "Password",password: true, type: 'password'),
                          uploadPhoto(context)
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3,left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: const Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black)
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){
                            if(controller.email.value.isNotEmpty && controller.petsName.value.isNotEmpty&&
                                controller.petsBreed.value.isNotEmpty&&controller.password.value.isNotEmpty&&controller.selectedImagePath.value.isNotEmpty){
                              //controller.setName(controller.name.value);
                             // print(controller.name.value);
                              final user = UserModel(
                                email: controller.email.value.trim(), petsName: controller.petsName.value.trim(), petsBreed: controller.petsBreed.value.trim(),

                              );
                              controller.setPetsName(controller.petsName.value);
                              controller.setPetsBreed(controller.petsBreed.value);
                              //controller.setContact(controller.contact.value);
                              FirebaseAuth.instance.createUserWithEmailAndPassword(email: controller.email.value, password: controller.password.value).then((value) => Get.offAllNamed(Routes.home,arguments: {'email':controller.email.value})).onError((error, stackTrace){
                                Get.snackbar("Error", error.toString());
                              });
                              controller.createUser(user);
                            }else{
                              Get.snackbar("Error", "Please enter valid name, contact, image",backgroundColor: Colors.red,
                              snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: const Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,
                            color: Colors.white

                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        TextButton(
                          onPressed: (){
                            Get.back();
                          },
                          child: Text("Login",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            color: Colors.black
                          ),),
                        ),
                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadPhoto(BuildContext context){
    return Obx(() {
        return Row(
          children: [
            ElevatedButton(
              child: const Text('Upload Photo',),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black26),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45)),
                        color: Colors.white
                      ),
                      height: 200,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  ElevatedButton(onPressed: (){
                                    controller.getImage(ImageSource.camera);
                                    Get.back();
                                  }, child:Icon(Icons.camera,size: 30,color: Colors.white,) ),

                                  Text("Camera")
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  ElevatedButton(onPressed: (){
                                    controller.getImage(ImageSource.gallery);
                                    Get.back();
                                  }, child:Icon(Icons.browse_gallery,size: 30,color: Colors.white,),),
                                  Text("Gallery")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
        SizedBox(width: 10,),
        controller.selectedImagePath.value.isNotEmpty?Text("PetImage.jpg"):SizedBox.shrink()
          ],
        );
      }
    );
  }

  Widget makeInput({label, password = false,email = false, type = ''}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        const SizedBox(height: 5,),
        TextField(
          obscureText: password,
          keyboardType: email ?TextInputType.emailAddress:TextInputType.text,
          onChanged: (value){
            if(type == 'email'){
              controller.email.value = value;
            }else if(type == 'petsName'){
              controller.petsName.value = value;
            }else if(type == 'petsBreed'){
              controller.petsBreed.value = value;
            }else if(type == "password"){
                controller.password.value = value;
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
        ),
        const SizedBox(height: 30,)

      ],
    );
  }

}
