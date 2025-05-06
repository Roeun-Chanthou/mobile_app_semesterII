import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> mode = ThemeMode.system.obs;
  RxInt themeIndex = 0.obs;

  void changeToSystem() {
    themeIndex.value = 0;
    mode.value = ThemeMode.system;
  }

  void changeToLight() {
    themeIndex.value = 1;
    mode.value = ThemeMode.light;
  }

  void changeToDark() {
    themeIndex.value = 2;
    mode.value = ThemeMode.dark;
  }
}
