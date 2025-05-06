import 'package:flutter_2/controller/theme_controller.dart';
import 'package:get/get.dart';

class DartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
