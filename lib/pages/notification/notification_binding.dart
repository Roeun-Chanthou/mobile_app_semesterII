import 'package:flutter_2/pages/notification/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController(), permanent: true);
  }
}
