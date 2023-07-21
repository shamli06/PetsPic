import 'package:flutter/material.dart';
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
                  height: Get.height/2,
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
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),boxShadow: [BoxShadow(blurRadius: 0.2)]
                      ),
                        child: Text("Email: ${controller.email.value}", style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),maxLines: 2,softWrap: true,)),
                    Container(
                        width: Get.width,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10),
                            ),boxShadow: [BoxShadow(blurRadius: 0.2)]
                        ),
                        child: Text("Pet's Name: ${controller.petsName.value}", style: TextStyle(fontSize: 20),softWrap: true,)),
                    Container(
                        width: Get.width,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10),
                            ),boxShadow: [BoxShadow(blurRadius: 0.2)]
                        ),
                        child: Text("Pet's Breed: ${controller.petsBreed.value}", style: TextStyle(fontSize: 20),)),
                    // Text("Contact No: ${controller.contact.value}", style: TextStyle(fontSize: 20),),
                  ],
                )

              ],
            ),
          ):SafeArea(
            child: controller.allUsers.isNotEmpty?Obx(() {
                return ListView.builder(
                  itemCount: controller.allUsers.length,
                    itemBuilder: (context,index){
                  return Container(
                    height: Get.height/6,
                    width: Get.width,
                    margin: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                          border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: Get.width/3,
                            child: Image.network(controller.images[index],fit: BoxFit.fill,)),
                        SizedBox(width: 3,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${controller.allUsers[index].email}", style: TextStyle(fontSize: 17),maxLines: 2,
                            softWrap: true,),
                            Text("Pet's Name: ${controller.allUsers[index].petsName}", style: TextStyle(fontSize: 17),maxLines: 2,),
                            Text("Pet's Breed: ${controller.allUsers[index].petsBreed}", style: TextStyle(fontSize: 17),maxLines: 2,)
                          ],
                        )
                      ],
                    ),
                  );
                });
              }
            ):Center(child: CircularProgressIndicator()),
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
