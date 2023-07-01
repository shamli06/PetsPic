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
}