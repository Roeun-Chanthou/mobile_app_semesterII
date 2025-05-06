import 'package:flutter_2/pages/people/user_controller.dart';
import 'package:get/get.dart';
class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
  }
}