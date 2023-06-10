import 'package:flutter/material.dart';
import 'package:petspic/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() {
          return Column(
            children: [
              Text(controller.name.value, style: TextStyle(fontSize: 20),),
              Text(controller.petsName.value, style: TextStyle(fontSize: 20),),
              Text(controller.petsBreed.value, style: TextStyle(fontSize: 20),),
              Text(controller.contact.value, style: TextStyle(fontSize: 20),)
            ],
          );
        }
      ),
    );
  }
}
