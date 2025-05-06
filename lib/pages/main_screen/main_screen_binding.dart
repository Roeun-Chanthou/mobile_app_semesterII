import 'package:flutter_2/pages/game_screen/games/game_controller.dart';
import 'package:flutter_2/pages/main_screen/main_screen_controller.dart';
import 'package:flutter_2/pages/people/user_controller.dart';
import 'package:flutter_2/pages/products/product_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController(), permanent: true);
    Get.put(ProductController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(GameController(), permanent: true);
  }
}
