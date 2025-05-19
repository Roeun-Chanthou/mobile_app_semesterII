import 'package:flutter/material.dart';
import 'package:flutter_2/controller/theme_controller.dart';
import 'package:flutter_2/pages/main_screen/main_screen_binding.dart';
import 'package:flutter_2/routes/routes_app.dart';
import 'package:flutter_2/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  await themeController.readTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeController,
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.watch<ThemeController>().mode;

    return GetMaterialApp(
      themeMode: mode,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RoutesName.user,
      // home: TestingScreen(),
      getPages: RoutesApp.routes,
      initialBinding: MainScreenBinding(),
    );
  }
}
