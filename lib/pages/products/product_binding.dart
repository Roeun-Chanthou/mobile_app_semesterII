import 'package:flutter_2/pages/products/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(), permanent: true);
  }
}
