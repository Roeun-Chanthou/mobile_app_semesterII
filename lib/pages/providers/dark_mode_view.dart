import 'package:flutter/material.dart';
import 'package:flutter_2/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class DarkModeView extends StatefulWidget {
  const DarkModeView({super.key});

  @override
  State<DarkModeView> createState() => _DarkModeViewState();
}

class _DarkModeViewState extends State<DarkModeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dark Mode Screen',
        ),
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
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
