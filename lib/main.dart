import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/core/utils/language_helper.dart';
import 'app/core/utils/theme/theme.dart';
import 'app/data/services/auth_service.dart';
import 'app/features/authentication/screens/onboarding/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Stripe.publishableKey = stripePublishableKey;

  String locale = await LanguageHelper.getLanguage();
  AuthService authService = AuthService();
  authService.isAppLoggedIn();
  initializeDateFormatting();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: AgrimedAppTheme.lightTheme,
    darkTheme: AgrimedAppTheme.darkTheme,
    home: const OnBoardingScreen(),
    builder: EasyLoading.init(),
  ));
}
