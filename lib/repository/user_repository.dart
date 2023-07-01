import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petspic/models/user_model.dart';
import 'package:flutter/material.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user)async{
    await _db.collection("Users").add(user.toJson()).whenComplete((){
      Get.snackbar("Success", "Your account has been created.",snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green,colorText: Colors.white);

    }).catchError((error, stackTrace){
      Get.snackbar("Error", "Something went wrong.",snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red,colorText: Colors.white);
      print("Error ${error.toString()}");
    });
  }
}