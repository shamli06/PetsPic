import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  //RxString name = ''.obs;
  RxString email = "".obs;
  RxString petsName = ''.obs;
  RxString petsBreed = ''.obs;
  RxString password = ''.obs;
  RxString selectedImagePath = ''.obs;

  void getImage(ImageSource imageSource)async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource, maxHeight: 250, maxWidth: Get.width);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      print(selectedImagePath.value);
      String path = "files/${pickedFile.name}";
      final file = File(pickedFile.path);
      final ref = FirebaseStorage.instance.ref().child("pet.jpg");
      try{
        await ref.putFile(file);
      } catch(error){
        Get.snackbar("Error", error.toString());
      }
      setImage(selectedImagePath.value);

    }else{
      Get.snackbar("Error", "No Image Selected",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red
          ,colorText: Colors.white);
    }
  }


  setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', name);
    print('name');
  }

  setPetsName(String petsName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('PetsName', petsName);
  }

  setPetsBreed(String petsBreed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('PetsBreed', petsBreed);
  }

  setContact(String contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Contact', contact);
  }

  setImage(String image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('PetImage', image);

  }

}
