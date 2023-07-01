
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{

  RxString name = ''.obs;
  RxString petsName = ''.obs;
  RxString petsBreed = ''.obs;
  RxString contact = ''.obs;

  var selectedImagePath = "".obs;

  RxInt selectedIndex = 0.obs;
  final ScrollController animationController = ScrollController();


  @override
  void onInit() {
    getName();
    getPetsName();
    getPetsBreed();
    getContact();
    getImage();
    super.onInit();
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value =  prefs.getString('Name')??"";
    update();
    print(name.value);
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