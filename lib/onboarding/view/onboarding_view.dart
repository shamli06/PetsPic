import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petspic/onboarding/controller/onboarding_controller.dart';
import 'package:petspic/routes/routes.dart';

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
                        children: [
                          makeInput(label: "Name", type: 'name'),
                          makeInput(label: "Pet's Name", type: 'petsName'),
                          makeInput(label: "Pet's Breed", type: 'petsBreed'),
                          makeInput(label: "Contact",contact: true, type: 'contact')
                        ],
                      ),
                    ),
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
                            if(controller.name.value.isNotEmpty && controller.petsName.value.isNotEmpty&&
                                controller.petsBreed.value.isNotEmpty&&controller.contact.value.isNotEmpty){
                              controller.setName(controller.name.value);
                              print(controller.name.value);
                              controller.setPetsName(controller.petsName.value);
                              controller.setPetsBreed(controller.petsBreed.value);
                              controller.setContact(controller.contact.value);

                              Get.toNamed(Routes.home);
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
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

  Widget makeInput({label, contact = false, type = ''}){
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
          keyboardType: contact ?TextInputType.number:TextInputType.text,
          onChanged: (value){
            if(type == 'name'){
              controller.name.value = value;
            }else if(type == 'petsName'){
              controller.petsName.value = value;
            }else if(type == 'petsBreed'){
              controller.petsBreed.value = value;
            }else if(type == "contact"){
              controller.contact.value = value;
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
