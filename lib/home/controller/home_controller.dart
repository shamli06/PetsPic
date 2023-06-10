import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{

  RxString name = ''.obs;
  RxString petsName = ''.obs;
  RxString petsBreed = ''.obs;
  RxString contact = ''.obs;

  @override
  void onInit() {
    getName();
    getPetsName();
    getPetsBreed();
    getContact();
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


}