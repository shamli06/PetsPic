import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petspic/routes/pages.dart';
import 'package:petspic/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  String name = "";
  getName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name =( prefs.getString('name'))??"";
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Managment',
      initialRoute:  name.isNotEmpty?Routes.home:Routes.login,
      getPages: getPages(),
    );
  }


}


