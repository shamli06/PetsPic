import 'package:get/get.dart';

class PetDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PetDetailsBinding());
  }

}