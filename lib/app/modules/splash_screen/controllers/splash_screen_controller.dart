import 'package:get/get.dart';

import '../../../data/services/app_config_service.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  AppService appService = AppService();

  Future<void> nextPage() async {
    bool firstTime = await AuthService().firstTime();

    if (firstTime == true) {
      Get.offAllNamed(Routes.ON_BOARDING);
    } else {
      if (AuthService.isAuthenticated) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
