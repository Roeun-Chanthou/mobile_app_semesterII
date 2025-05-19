import 'package:flutter_2/restful_api/newuser/newuser_controller.dart';
import 'package:get/get.dart';

class NewUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewUserController());
  }
}
