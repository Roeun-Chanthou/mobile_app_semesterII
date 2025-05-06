import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/pages/main_screen/main_screen_view.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
      ),
      splashIconSize: 300,
      nextScreen: MainScreenView(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
