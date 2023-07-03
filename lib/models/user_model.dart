
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  String? email;
  String? petsName;
  String? petsBreed;
  String? password;

  UserModel({
    this.id,
    required this.email,
    required this.petsName,
    required this.petsBreed,
    //required this.password,
});

  toJson(){
    return{
      "Email": email,
      "PetsName": petsName,
      "PetsBreed":petsBreed,
      //"Password":password
    };
  }
//fetch data from firestore to user model
  factory UserModel.fromSnapshot(DocumentSnapshot <Map<String, dynamic>> document){
    final data = document.data();
    return UserModel(
      id: document.id,
        email: data?["Email"], petsName: data?["PetsName"], petsBreed: data?["PetsBreed"]);
  }
}