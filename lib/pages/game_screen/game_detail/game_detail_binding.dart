import 'package:flutter_2/pages/game_screen/game_detail/game_detail_controller.dart';
import 'package:get/get.dart';

class GameDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GameDetailController(), permanent: true);
  }
}
