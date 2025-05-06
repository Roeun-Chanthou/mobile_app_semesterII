
import 'package:flutter_2/pages/game_screen/games/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GameController(), permanent: true);
  }
}
