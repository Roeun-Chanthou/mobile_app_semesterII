import 'package:flutter_2/restful_api/user/user_controller.dart';
import 'package:get/get.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }
}
