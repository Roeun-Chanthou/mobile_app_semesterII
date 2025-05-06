import 'package:flutter/material.dart';
import 'package:flutter_2/controller/theme_controller.dart';
import 'package:flutter_2/pages/game_screen/games/game_view.dart';
import 'package:flutter_2/pages/main_screen/main_screen_controller.dart';
import 'package:flutter_2/pages/people/user_view.dart';
import 'package:flutter_2/pages/products/product_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: _buildDrawer(context),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            ProductView(),
            UserView(),
            GameView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            if (value == 3) {
              controller.scaffoldKey.currentState!.openEndDrawer();
            } else {
              controller.currentIndex.value = value;
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Game',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    int themeIndex = context.watch<ThemeController>().themeIndex;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.face_2,
            ),
          ),
          ExpansionTile(
            title: Text("Theme"),
            initiallyExpanded: true,
            children: [
              ListTile(
                title: Text("To System Mode"),
                leading: Icon(Icons.phone_android),
                onTap: () {
                  context.read<ThemeController>().changeToSystem();
                },
                trailing: themeIndex == 0 ? Icon(Icons.check_circle) : null,
              ),
              ListTile(
                title: Text("To Light Mode"),
                leading: Icon(Icons.light_mode),
                onTap: () {
                  context.read<ThemeController>().changeToLight();
                },
                trailing: themeIndex == 1 ? Icon(Icons.check_circle) : null,
              ),
              ListTile(
                title: Text("To Dark Mode"),
                leading: Icon(Icons.dark_mode),
                onTap: () {
                  context.read<ThemeController>().changeToDark();
                },
                trailing: themeIndex == 2 ? Icon(Icons.check_circle) : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
