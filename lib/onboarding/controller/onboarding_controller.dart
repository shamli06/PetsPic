import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  RxString name = ''.obs;
  RxString petsName = ''.obs;
  RxString petsBreed = ''.obs;
  RxString contact = ''.obs;


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

}
