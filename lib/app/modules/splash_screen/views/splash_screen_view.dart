import 'package:agimed/app/core/utils/language_helper.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
      controller: FlameSplashController(
        waitDuration: const Duration(seconds: 4),
      ),
      theme: FlameSplashTheme(
        logoBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/logos/logo.png',
              width: 200,
            ),
          );
        },
        backgroundDecoration: const BoxDecoration(color: black),
      ),
      onFinish: (BuildContext context) async {
        LanguageHelper.setLTR();
        controller.nextPage();
      },
    );
  }
}
