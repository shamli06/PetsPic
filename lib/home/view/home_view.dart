import 'dart:io';
import 'package:flutter/material.dart';
import 'package:petspic/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() {
          return controller.selectedIndex.value == 1?
          SafeArea(
            child: Column(
              children: [
                controller.selectedImagePath.value.isNotEmpty?Container(
                  height: Get.height/3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent
                  ),
                    child: Image.file(File(controller.selectedImagePath.value))):SizedBox.shrink(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: "+controller.name.value, style: TextStyle(fontSize: 20),),
                    Text("Pet's Name: "+controller.petsName.value, style: TextStyle(fontSize: 20),),
                    Text("Pet's Breed: "+controller.petsBreed.value, style: TextStyle(fontSize: 20),),
                    Text("Contact No: "+controller.contact.value, style: TextStyle(fontSize: 20),),
                  ],
                )

              ],
            ),
          ):SafeArea(
            child: GridView.count(crossAxisCount: 2,scrollDirection: Axis.vertical,children: [
              Image.network('https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2018/03/29/21/51/cute-3273789_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2018/03/29/21/51/cute-3273789_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2018/03/31/06/31/dog-3277417_1280.jpg'),
              Image.network('https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg'),

            ],),
          );
        }

      ),
      bottomNavigationBar: Obx(
         () {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'My Pet',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: (index){
              controller.selectedIndex.value = index;
              controller.update();
            },
          );
        }
      ),
    );
  }

}
