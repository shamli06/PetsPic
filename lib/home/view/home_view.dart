import 'package:flutter/material.dart';
import 'package:petspic/constant/images.dart';
import 'package:petspic/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

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
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent
                  ),
                    child: Image(
                      image: NetworkImage(controller.selectedImagePath.value),
                      fit: BoxFit.cover,
                    )):SizedBox.shrink(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${controller.name.value}", style: TextStyle(fontSize: 20),),
                    Text("Pet's Name: ${controller.petsName.value}", style: TextStyle(fontSize: 20),),
                    Text("Pet's Breed: ${controller.petsBreed.value}", style: TextStyle(fontSize: 20),),
                    Text("Contact No: ${controller.contact.value}", style: TextStyle(fontSize: 20),),
                  ],
                )

              ],
            ),
          ):SafeArea(
            child: GridView.count(crossAxisCount: 2,scrollDirection: Axis.vertical,children: [
              Image.network(Images.image5),
              Image.network(Images.image4),
              Image.network(Images.image3),
              Image.network(Images.image2),
              Image.network(Images.image1),
              Image.network(Images.image5),
              Image.network(Images.image3),
              Image.network(Images.image4),
              Image.network(Images.image2),
              Image.network(Images.image1),

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
            selectedItemColor: Colors.blueAccent,
            onTap: (index){
              controller.selectedIndex.value = index;
              controller.update();
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Get.offAllNamed(Routes.login);
      }, label: Text("Logout")),
    );
  }

}
