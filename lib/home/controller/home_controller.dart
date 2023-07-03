
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petspic/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class HomeController extends GetxController{

  RxString email = ''.obs;
  RxString petsName = ''.obs;
  RxString petsBreed = ''.obs;
  RxString contact = ''.obs;

  var selectedImagePath = "".obs;

  RxInt selectedIndex = 0.obs;
  final ScrollController animationController = ScrollController();
  final _userRepo = Get.put(UserRepository());


  @override
  void onInit() {
    email.value = Get.arguments["email"];
    print("email ${email.value}");
    getUserData(email.value);
    getName();
    getPetsName();
    getPetsBreed();
    getContact();
    getImage();
    super.onInit();
  }

  getUserData(String email)async{
    if(email != null){
      UserModel userData =  await _userRepo.getUserDetails(email);
      petsName.value = userData.petsName??"";
      petsBreed.value = userData.petsBreed??"";
      update();
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.value =  prefs.getString('Name')??"";
    update();
    print(email.value);
    return prefs.getString('Name');
  }

  getPetsName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    petsName.value = prefs.getString('PetsName')??'';
    update();
    return prefs.getString('PetsName');
  }

  getPetsBreed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    petsBreed.value = prefs.getString('PetsBreed')??"";
    update();
    return prefs.getString('PetsBreed');
  }

  getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    contact.value = prefs.getString('Contact')??"";
    update();
    return prefs.getString('Contact');
  }

  getImage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedImagePath.value = prefs.getString('PetImage')??"";
    final ref = FirebaseStorage.instance.ref().child("pet.jpg");
    final url = await ref.getDownloadURL();
    selectedImagePath.value = url;
    update();
    return prefs.getString('PetImage');
  }


}