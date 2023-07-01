import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{


  RxString email = "".obs;
  RxString password = "".obs;

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    update();
    //print(name.value);
    return prefs.getString('Name');
  }

  getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    update();
    return prefs.getString('Contact');
  }
}