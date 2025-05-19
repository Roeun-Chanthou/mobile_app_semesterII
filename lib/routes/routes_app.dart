import 'package:flutter_2/pages/dark_get_x/dark_view.dart';
import 'package:flutter_2/pages/game_screen/game_detail/game_detail_binding.dart';
import 'package:flutter_2/pages/game_screen/game_detail/game_detail_view.dart';
import 'package:flutter_2/pages/game_screen/games/game_binding.dart';
import 'package:flutter_2/pages/game_screen/games/game_view.dart';
import 'package:flutter_2/pages/main_screen/main_screen_binding.dart';
import 'package:flutter_2/pages/main_screen/main_screen_view.dart';
import 'package:flutter_2/pages/people/user_binding.dart';
import 'package:flutter_2/pages/people/user_view.dart';
import 'package:flutter_2/pages/products/product_binding.dart';
import 'package:flutter_2/pages/products/product_view.dart';
import 'package:flutter_2/pages/splash/splash_view.dart';
import 'package:flutter_2/restful_api/newuser/newuser_binding.dart';
import 'package:flutter_2/restful_api/newuser/newuser_view.dart';
import 'package:flutter_2/restful_api/user/user_binding.dart';
import 'package:flutter_2/restful_api/user/user_view.dart';
import 'package:flutter_2/routes/routes_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesApp {
  static final routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashView(),
    ),
    GetPage(
      name: RoutesName.mainScreen,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: RoutesName.dark,
      page: () => DarkModeGetXView(),
    ),
    GetPage(
      name: RoutesName.userScreen,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: RoutesName.productScreen,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: RoutesName.gameScreen,
      page: () => GameView(),
      binding: GameBinding(),
    ),
    GetPage(
      name: RoutesName.gameDetailScreen,
      page: () => GameDetailView(),
      binding: GameDetailBinding(),
    ),
    GetPage(
      name: RoutesName.user,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: RoutesName.newuser,
      page: () => NewUserView(),
      binding: NewUserBinding(),
    ),
  ];
}
