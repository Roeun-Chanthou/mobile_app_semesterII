import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final currentIndex = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
