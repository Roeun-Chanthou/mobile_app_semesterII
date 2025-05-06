import 'package:flutter/material.dart';
import 'package:flutter_2/pages/dark_get_x/dark_controller.dart';
import 'package:get/get.dart';

class DarkModeGetXView extends GetView<ThemeController> {
  const DarkModeGetXView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dark Mode Screen')),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Icon(Icons.face_2),
          ),
          ExpansionTile(
            title: Text("Theme"),
            initiallyExpanded: true,
            children: [
              Obx(
                () => ListTile(
                  title: Text("To System Mode"),
                  leading: Icon(Icons.phone_android),
                  onTap: () => controller.changeToSystem(),
                  trailing: controller.themeIndex.value == 0
                      ? Icon(Icons.check_circle)
                      : null,
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text("To Light Mode"),
                  leading: Icon(Icons.light_mode),
                  onTap: () => controller.changeToLight(),
                  trailing: controller.themeIndex.value == 1
                      ? Icon(Icons.check_circle)
                      : null,
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text("To Dark Mode"),
                  leading: Icon(Icons.dark_mode),
                  onTap: () => controller.changeToDark(),
                  trailing: controller.themeIndex.value == 2
                      ? Icon(Icons.check_circle)
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
