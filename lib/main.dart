import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petspic/routes/pages.dart';
import 'package:petspic/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Managment',
      initialRoute: Routes.initial_route,
      getPages: getPages(),
    );
  }
}

